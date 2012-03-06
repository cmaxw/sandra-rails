namespace :sandra do
  task :migrate => :environment do
    sandra_config = YAML::load_file("#{::Rails.root.to_s}/config/sandra.yml")[::Rails.env].symbolize_keys
    keyspace = sandra_config[:keyspace]
    store = Cassandra.new(keyspace)
    cfs = sandra_config[:column_families]
    current_cfs = {}
    store.schema.cf_defs.each do |cfdef|
      current_cfs[cfdef.name] = cfdef
    end
    updated_cfs = current_cfs.keys & cfs.keys
    deleted_cfs = current_cfs.keys - cfs.keys
    new_cfs = cfs.keys - current_cfs.keys
    new_cfs.each do |name, options|
      options = options.is_a?(Hash) ? options : {}
      cf_def = CassandraThrift::CfDef.new({:keyspace => keyspace, :name => name}.merge(options))
      store.add_column_family(cf_def)
    end
    # TODO: Update existing column families
    #updated_cfs.each do |name, options|
      #options = options.is_a?(Hash) ? options : {}
      #cf_def = update_cf(current_cfs[name], options)
      #store.update_column_family(cf_def)
    #end
    deleted_cfs.each do |name|
      store.drop_column_family(name)
    end
  end
end

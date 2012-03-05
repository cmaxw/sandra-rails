namespace :sandra do
  task :migrate => :environment do
    sandra_config = YAML::load_file("#{::Rails.root.to_s}/config/sandra.yml")[::Rails.env]
    keyspace = sandra_config[:keyspace]
    store = Cassandra.new(keyspace)
    cfs = sandra_config[:column_families]
    cfs.each do |name, options|
      options = Hash(options)
      cf_def = CassandraThrift::CfDef.new({:keyspace => keyspace, :name => name}.merge(options))
      store.add_column_family(cf_def)
      store.update_column_family(cf_def)
    end
  end
end

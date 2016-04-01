DATABASE_URL = "postgres://localhost/thermostat"
DataMapper.setup(:default, DATABASE_URL)

DataMapper.finalize
DataMapper.auto_migrate!

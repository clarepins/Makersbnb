def clean_test_database
  @conn = PG.connect(dbname: 'makersbnb_test')
  @conn.exec("TRUNCATE listings;")
end

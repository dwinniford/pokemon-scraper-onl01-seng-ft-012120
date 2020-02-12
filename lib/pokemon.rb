class Pokemon
  attr_accessor :id, :name, :type, :db 
  
  def initialize(id: nil, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type 
    @db = db 
  end 
  
  def save
    sql = <<-SQL
      INSERT INTO students (name, type)
      VALUES (?, ?)
    SQL
    @db.execute(sql, self.name, self.type)
    @id = @db.execute(SELECT insert_last_rowid() FROM pokemon)
  end 
  
end

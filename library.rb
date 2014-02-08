
class Book
  attr_reader :author
  attr_reader :title
  attr_accessor :id
  attr_accessor :status
  attr_accessor :borrower


  def initialize(title, author)
    @author = author
    @title = title
    @id = id
    @status = "available"
    @borrower = borrower

  end

  def check_out
    if @status == "checked_out"
      false
    else
      @status = "checked_out"
      true
    end
  end

  def check_in
    @status = "available"
  end

end

class Borrower
  attr_reader :name
  attr_accessor :booknumber

  def initialize(name)
    @name = name
    @booknumber = 0
  end
end

class Library

  attr_accessor :id
  attr_accessor :book
  attr_accessor :borrower
  attr_accessor :counter

  def initialize(name)
    @books = []
    @id = id
    @counter = 0
   
  end

  def books
    @books
  end

  def register_new_book(title, author)
    x = Book.new(title, author)
    x.id = rand(100)
    @books << x
  end

  def check_out_book(book_id, borrower)
    if borrower.booknumber  > 1
      nil
    else books.each do |x|
      if x.id == book_id
        borrower.booknumber += 1
        x.borrower = borrower
        if x.check_out
          return x
        else 
          return nil
        end
      end
      end
    end
  end

  def get_borrower(book_id)
      books.each do |x|
        if x.id == book_id
          return x.borrower.name
        end
      end
  end

  def check_in_book(book)
    book.check_in
  end

  def available_books
    books.select do |x|
      x.status == "available"
    end
  end

  def borrowed_books
    books.select do |x|
      x.status == "checked_out"
    end
  end
end

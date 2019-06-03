class BooksController < ApplicationController
  def list
    @books = Book.all

    render("book_templates/list.html.erb")
  end

  def details
    @book = Book.where({ :id => params.fetch("id_to_display") }).first

    render("book_templates/details.html.erb")
  end

  def blank_form
    @book = Book.new

    render("book_templates/blank_form.html.erb")
  end

  def save_new_info
    @book = Book.new

    @book.title = params.fetch("title")
    @book.author = params.fetch("author")
    @book.cover = params.fetch("cover")
    @book.amazon = params.fetch("amazon")
    @book.donator_id = params.fetch("donator_id")
    @book.borrowed = params.fetch("borrowed", false)

    if @book.valid?
      @book.save

      redirect_to("/books", { :notice => "Book created successfully." })
    else
      render("book_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @book = Book.where({ :id => params.fetch("id_to_prefill") }).first

    render("book_templates/prefilled_form.html.erb")
  end

  def save_edits
    @book = Book.where({ :id => params.fetch("id_to_modify") }).first

    @book.title = params.fetch("title")
    @book.author = params.fetch("author")
    @book.cover = params.fetch("cover")
    @book.amazon = params.fetch("amazon")
    @book.donator_id = params.fetch("donator_id")
    @book.borrowed = params.fetch("borrowed", false)

    if @book.valid?
      @book.save

      redirect_to("/books/" + @book.id.to_s, { :notice => "Book updated successfully." })
    else
      render("book_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @book = Book.where({ :id => params.fetch("id_to_remove") }).first

    @book.destroy

    redirect_to("/books", { :notice => "Book deleted successfully." })
  end
end

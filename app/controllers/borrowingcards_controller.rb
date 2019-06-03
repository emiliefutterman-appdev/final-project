class BorrowingcardsController < ApplicationController
  def list
    @borrowingcards = Borrowingcard.all

    render("borrowingcard_templates/list.html.erb")
  end

  def details
    @borrowingcard = Borrowingcard.where({ :id => params.fetch("id_to_display") }).first

    render("borrowingcard_templates/details.html.erb")
  end

  def blank_form
    @borrowingcard = Borrowingcard.new

    render("borrowingcard_templates/blank_form.html.erb")
  end

  def save_new_info
    @borrowingcard = Borrowingcard.new

    @borrowingcard.borrower_id = params.fetch("borrower_id")
    @borrowingcard.book_id = params.fetch("book_id")

    if @borrowingcard.valid?
      @borrowingcard.save

      redirect_to("/borrowingcards", { :notice => "Borrowingcard created successfully." })
    else
      render("borrowingcard_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @borrowingcard = Borrowingcard.where({ :id => params.fetch("id_to_prefill") }).first

    render("borrowingcard_templates/prefilled_form.html.erb")
  end

  def save_edits
    @borrowingcard = Borrowingcard.where({ :id => params.fetch("id_to_modify") }).first

    @borrowingcard.borrower_id = params.fetch("borrower_id")
    @borrowingcard.book_id = params.fetch("book_id")

    if @borrowingcard.valid?
      @borrowingcard.save

      redirect_to("/borrowingcards/" + @borrowingcard.id.to_s, { :notice => "Borrowingcard updated successfully." })
    else
      render("borrowingcard_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @borrowingcard = Borrowingcard.where({ :id => params.fetch("id_to_remove") }).first

    @borrowingcard.destroy

    redirect_to("/borrowingcards", { :notice => "Borrowingcard deleted successfully." })
  end
end

class BookTypesController < ApplicationController
  before_action :set_book_type, only: %i[show edit update destroy delete]

  def search
    @book_types = BookType.where(status: BookType::READY_STATUS)
                          .where('book_name like ? ', "%#{params[:book_name]}%")
                          .order(id: :desc)
                          .page(params[:page])
    render 'index'
  end

  # GET /book_types
  # GET /book_types.json
  def index
    @book_types = BookType.where(status: BookType::READY_STATUS)
                          .order(id: :desc)
                          .page(params[:page])
  end

  # GET /book_types/1
  # GET /book_types/1.json
  def show
    @books = Book.where('book_type_id': params[:id])
                 .order(:id)
                 .page(params[:page])
  end

  # GET /book_types/new
  def new
    @book_type = BookType.new
  end

  # GET /book_types/1/edit
  def edit; end

  # POST /book_types
  # POST /book_types.json
  def create
    @book_type = BookType.new(book_type_params)

    respond_to do |format|
      if @book_type.save
        format.html { redirect_to @book_type, notice: 'Book type was successfully created.' }
        format.json { render :show, status: :created, location: @book_type }
      else
        format.html { render :new }
        format.json { render json: @book_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_types/1
  # PATCH/PUT /book_types/1.json
  def update
    respond_to do |format|
      if @book_type.update(book_type_params)
        format.html { redirect_to @book_type, notice: 'Book type was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_type }
      else
        format.html { render :edit }
        format.json { render json: @book_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_types/1
  # DELETE /book_types/1.json
  def destroy
    @book_type.destroy
    respond_to do |format|
      format.html { redirect_to book_types_url, notice: 'Book type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book_type
    @book_type = BookType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_type_params
    params.require(:book_type).permit(:book_name, :introduction, :img_paths, :catalog)
  end
end

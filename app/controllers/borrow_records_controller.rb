class BorrowRecordsController < ApplicationController
  before_action :set_borrow_record, only: [:show, :edit, :update, :destroy]

  # GET /borrow_records
  # GET /borrow_records.json
  def index
    @borrow_records = BorrowRecord.all
  end

  # GET /borrow_records/1
  # GET /borrow_records/1.json
  def show
  end

  # GET /borrow_records/new
  def new
    @borrow_record = BorrowRecord.new
  end

  # GET /borrow_records/1/edit
  def edit
  end

  # POST /borrow_records
  # POST /borrow_records.json
  def create
    @borrow_record = BorrowRecord.new(borrow_record_params)
    respond_to do |format|
      if @borrow_record.save
        format.html { redirect_to @borrow_record, notice: 'Borrow record was successfully created.' }
        format.json { render :show, status: :created, location: @borrow_record }
      else
        format.html { render :new }
        format.json { render json: @borrow_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrow_records/1
  # PATCH/PUT /borrow_records/1.json
  def update
    respond_to do |format|
      if @borrow_record.update(borrow_record_params)
        format.html { redirect_to @borrow_record, notice: 'Borrow record was successfully updated.' }
        format.json { render :show, status: :ok, location: @borrow_record }
      else
        format.html { render :edit }
        format.json { render json: @borrow_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrow_records/1
  # DELETE /borrow_records/1.json
  def destroy
    @borrow_record.destroy
    respond_to do |format|
      format.html { redirect_to borrow_records_url, notice: 'Borrow record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrow_record
      @borrow_record = BorrowRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borrow_record_params
      params.require(:borrow_record).permit(:user_id, :book_id, :borrow_time, :time_limit, :status, :book_name, :serial_code, :user_name)
    end
end

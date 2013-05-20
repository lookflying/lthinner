require 'rubygems'
require 'google_chart'
class WeightRecordsController < ApplicationController
	def dygraph
		@records = WeightRecord.all
	end

	def gchart
    # Line Chart
		@weight_records = WeightRecord.all
		@records_array = []
		@string = ""
		@weight_records.each do |record|
			@records_array.push(record.weight)
			@string << record.weight.to_s + " "
		end
    GoogleChart::LineChart.new('320x200', "Line Chart", false) do |lc|
      lc.data "Weight", @records_array, '0000ff'
      lc.show_legend = true
      lc.axis :y, :range => [0,200], :color => 'ff00ff', :font_size => 16, :alignment => :center
      lc.axis :x, :range => [0,50], :color => '00ffff', :font_size => 16, :alignment => :center
      lc.grid :x_step => 100.0/6.0, :y_step => 100.0/6.0, :length_segment => 1, :length_blank => 0
      @url = lc.to_url
    end
	end	

	def chart
	end
	
  # GET /weight_records
  # GET /weight_records.json
  def index
    @weight_records = WeightRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weight_records }
    end
  end

  # GET /weight_records/1
  # GET /weight_records/1.json
  def show
    @weight_record = WeightRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weight_record }
    end
  end

  # GET /weight_records/new
  # GET /weight_records/new.json
  def new
    @weight_record = WeightRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weight_record }
    end
  end

  # GET /weight_records/1/edit
  def edit
    @weight_record = WeightRecord.find(params[:id])
  end

  # POST /weight_records
  # POST /weight_records.json
  def create
    @weight_record = WeightRecord.new(params[:weight_record])

    respond_to do |format|
      if @weight_record.save
        format.html { redirect_to @weight_record, notice: 'Weight record was successfully created.' }
        format.json { render json: @weight_record, status: :created, location: @weight_record }
      else
        format.html { render action: "new" }
        format.json { render json: @weight_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weight_records/1
  # PUT /weight_records/1.json
  def update
    @weight_record = WeightRecord.find(params[:id])

    respond_to do |format|
      if @weight_record.update_attributes(params[:weight_record])
        format.html { redirect_to @weight_record, notice: 'Weight record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weight_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weight_records/1
  # DELETE /weight_records/1.json
  def destroy
    @weight_record = WeightRecord.find(params[:id])
    @weight_record.destroy

    respond_to do |format|
      format.html { redirect_to weight_records_url }
      format.json { head :no_content }
    end
  end
end

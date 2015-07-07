class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    IO.popen(["mail", "-s", "New Info Request", "jon@railsclass.com"], "w") {|f|
      f.puts @request.name;
      f.puts @request.email;
      f.close_write;
    }
    IO.popen(["mail", "-s", "New Info Request", "celia@railsclass.com"], "w") {|f|
      f.puts @request.name;
      f.puts @request.email;
      f.close_write;
    }

    gb = Gibbon::API.new

    name_array = request_params[:name].split
    first_name = request_params[:name]
    last_name = ""
    if name_array.length > 1 && name_array[0].length > 0 && name_array[1].length > 0
      first_name = name_array[0]
      last_name = name_array[1]
    end
    puts "subscribing new user to list"
    gb.lists.subscribe({:id => "75aba6bef3", :email => {:email => request_params[:email]}, :merge_vars => {:FNAME => first_name, :LNAME => last_name}, :double_optin => true})

    respond_to do |format|
      if @request.save
        format.html { redirect_to root_path, notice: "Great, we'll be in touch soon!" }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:email, :name)
    end
end

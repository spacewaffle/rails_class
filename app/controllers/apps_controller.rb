class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.all
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params)
    IO.popen(["mail", "-s", "New Application request", "jon@railsclass.com"], "w") {|f|
      f.puts @app.name;
      f.puts @app.email;
      f.puts @app.phone;
      f.puts @app.date;
      f.puts @app.employment;
      f.puts @app.currently;
      f.puts @app.looking_for;
      f.puts @app.experience;
      f.puts @app.ideas;
      f.puts @app.linkedin;
      f.puts @app.heard_from;
      f.close_write;
    }
    IO.popen(["mail", "-s", "New Application request", "celia@railsclass.com"], "w") {|f|
      f.puts @app.name;
      f.puts @app.email;
      f.puts @app.phone;
      f.puts @app.date;
      f.puts @app.employment;
      f.puts @app.currently;
      f.puts @app.looking_for;
      f.puts @app.experience;
      f.puts @app.ideas;
      f.puts @app.linkedin;
      f.puts @app.heard_from;
      f.close_write;
    }

    gb = Gibbon::API.new
    
    name_array = app_params[:name].split
    first_name = app_params[:name]
    last_name = ""
    if name_array.length > 1 && name_array[0].length > 0 && name_array[1].length > 0
      first_name = name_array[0]
      last_name = name_array[1]
    end
    puts "subscribing new user to list"
    
    gb.lists.subscribe({:id => "75aba6bef3", :email => {:email => app_params[:email]}, :merge_vars => {:FNAME => first_name, :LNAME => last_name}, :double_optin => true})


    respond_to do |format|
      if @app.save
        format.html { redirect_to root_path, notice: "A lovely application! We'll be in touch soon!" }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:email, :name, :date, :phone, :employment, :currently, :looking_for, :experience, :ideas, :linkedin, :heard_from)
    end
end

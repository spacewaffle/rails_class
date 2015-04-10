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
    @hide_nav = true
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params)
    IO.popen(["mail", "-s", "New Application request", "jon.syndicate@gmail.com"], "w") {|f|
      f.puts @app.name;
      f.puts @app.email;
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

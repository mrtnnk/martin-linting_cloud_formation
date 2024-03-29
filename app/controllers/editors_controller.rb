require 'open3'

class EditorsController < ApplicationController
  before_action :set_editor, only: [:show, :edit, :update, :destroy]

  # GET /editors
  # GET /editors.json
  def index
    @editors = Editor.all
  end

  def check_validate
    uploader = CfgvalidatorUploader.new
    uploader.store!(params[:editor][:cfgfile])
    cmd = "cfn_nag \"#{Rails.root}/public/uploads/#{params[:editor][:cfgfile].original_filename}\""
    Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
      puts "stdout is: " + stdout.read
      puts "stderr is: " + stderr.read
    end
  end

  # GET /editors/1
  # GET /editors/1.json
  def show
  end

  # GET /editors/new
  def new
    @editor = Editor.new
  end

  # GET /editors/1/edit
  def edit

  end

  # POST /editors
  # POST /editors.json
  def create
    @editor = Editor.new(editor_params)

    respond_to do |format|
      if @editor.save
        format.html { redirect_to @editor, notice: 'Editor was successfully created.' }
        format.json { render :show, status: :created, location: @editor }
      else
        format.html { render :new }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editors/1
  # PATCH/PUT /editors/1.json
  def update
    respond_to do |format|
      if @editor.update(editor_params)
        format.html { redirect_to @editor, notice: 'Editor was successfully updated.' }
        format.json { render k:show, status: :ok, location: @editor }
      else
        format.html { render :edit }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editors/1
  # DELETE /editors/1.json
  def destroy
    @editor.destroy
    respond_to do |format|
      format.html { redirect_to editors_url, notice: 'Editor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editor
      @editor = Editor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editor_params
      params.require(:editor).permit(:cfgfile)
    end
end

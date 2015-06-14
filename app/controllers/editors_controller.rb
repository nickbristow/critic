class EditorsController < ApplicationController
  def index
    @editors = Editor.all
  end
  
  def show
    @editor = Editor.find params[:id]
  end

  def new
    @editor = Editor.new
  end

  def create
    @editor = Editor.new editor_params

    if @editor.save
      redirect_to @editor
    else
      render :new
    end
  end

  def edit
    @editor = Editor.find params[:id]
  end

  def update
    @editor = Editor.find params[:id]
    if @editor.update(editor_params)
      redirect_to @editor
    else
      render :edit
    end
  end

  def destroy 
    @editor = Editor.find params[:id]
    @editor.destroy
    redirect_to :root
  end

  private
  def editor_params
    params.require(:editor).permit(:name, :outlet, :bio, :image)
  end
end

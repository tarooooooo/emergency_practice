class Public::EntriesController < ApplicationController
  before_action :set_entry, only: [:show]

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to entry_path(@entry)
    else
      render :new
    end
  end

  def show; end

  private

  def entry_params
    params.require(:entry).permit(:description, :image)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end
end

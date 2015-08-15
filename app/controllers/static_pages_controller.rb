class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def locations
    waldo = Character.where(name:  'waldo')[0]
    wizardo = Character.where(name:  'wizardo')[0]
    bandido = Character.where(name: 'bandido')[0]
    answer = {
      'waldo' => {left: waldo.left,
                  top: waldo.top,
                  width:waldo.width,
                  height:waldo.height},
      'wizardo' => {left: wizardo.left,
                  top: wizardo.top,
                  width:wizardo.width,
                  height:wizardo.height},
      'bandido' => {left: bandido.left,
                  top: bandido.top,
                  width:bandido.width,
                  height:bandido.height},
    }
    render json: answer
  end
end

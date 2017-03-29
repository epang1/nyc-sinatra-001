class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures/new' do
    figure_info = params["figure"]
    new_title = params["title"]
    new_landmark = params["landmark"]

    @new_figure = Figure.create(figure_info)
    @new_figure.save


    if !new_landmark[:name].empty?
      new_landmark = Landmark.create(new_landmark)
      @new_figure.landmarks << new_landmark
    end

    if !new_title[:name].empty?
      new_title = Title.create(new_title)
      @new_figure.titles << new_title
    end

    @new_figure.save
  end

  get '/figures' do
    erb :'figures/figure'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    figure_info = params[:figure]
    @figure = Figure.find(params[:id])
    @figure.update(figure_info)

    if !new_landmark[:name].empty?
      new_landmark = Landmark.create(new_landmark)
      @figure.landmarks << new_landmark
    end

    if !new_title[:name].empty?
      new_title = Title.create(new_title)
      @figure.titles << new_title
    end

    @figure.save
  end

end

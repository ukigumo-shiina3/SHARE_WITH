class SearchController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params['search']['model']
    @content = params['search']['content']
    @how = params['search']['how']
    @event_from = params['search']['event_begin_date']
    @event_to = params['search']['event_finish_date']
    @datas = search_for(@how, @model, @content, @event_from, @event_to)
  end

  private

  def match(model, content, from, to)
    if model == 'user'
      User.where(name: content)
    elsif model == 'event'
      Event.where(title: content).where('event_date BETWEEN ? AND ?', from, to)
    end
  end

  def forward(model, content, from, to)
    if model == 'user'
      User.where('name LIKE ?', "#{content}%")
    elsif model == 'event'
      Event.where('title LIKE ?', "#{content}%").where('event_date BETWEEN ? AND ?', from, to)
    end
  end

  def backward(model, content, from, to)
    if model == 'user'
      User.where('name LIKE ?', "%#{content}")
    elsif model == 'event'
      Event.where('title LIKE ?', "%#{content}").where('event_date BETWEEN ? AND ?', from, to)
    end
  end

  def partical(model, content, from, to)
    if model == 'user'
      User.where('name LIKE ?', "%#{content}%")
    elsif model == 'event'
      Event.where('title LIKE ?', "%#{content}%").where('event_date BETWEEN ? AND ?', from, to)
    end
  end

  def search_for(how, model, content, from, to)
    case how
    when 'match'
      match(model, content, from, to)
    when 'forward'
      forward(model, content, from, to)
    when 'backward'
      backward(model, content, from, to)
    when 'partical'
      partical(model, content, from, to)
    end
  end
end

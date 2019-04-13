class Api::V1::SlackController < ApplicationController
  # CSRFチェックの除外設定
  protect_from_forgery :except => [:receive_message]

  # POST /api/v1/slack/event
  def receive_event_api
    body = JSON.parse(request.body.read)
    logger.info("request body => #{body.to_s}")

    case body['type']
    when 'url_verification' then
      logger.info("event type : url_verification")
      render json: body
    else
      logger.info("event type : other[#{body['type']}]")
      render json: {}
    end
  end
end

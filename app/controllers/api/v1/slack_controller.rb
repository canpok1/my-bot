module Api
  module V1
    class SlackController < ApplicationController
      # CSRFチェックの除外設定
      protect_from_forgery :except => [:receive_message]
    
      # POST /api/v1/slack/event
      def receive_event_api
        body = JSON.parse(request.body.read)
        logger.info("request body => #{body.to_s}")
    
        response_body = ::ReceiveMessageUsecase.new(logger).execute(body)
    
        render json: response_body
      end
    end
  end
end

module Api
  module V1
    class ReceiveMessageUsecase
    
      def initialize(logger)
        @logger = logger
        @slack = SlackService.new(Rails.application.secrets.slack_api_token)
      end
    
      # 
      def execute(params)
        case params['type']
        when 'url_verification' then
          logger.info("event type : url_verification")
          return params
        when 'app_mention' then
          logger.info("event type : app_mention")
          return params
        else
          logger.info("event type : other[#{params['type']}]")
          return {}
        end
      end
    
    end
  end
end

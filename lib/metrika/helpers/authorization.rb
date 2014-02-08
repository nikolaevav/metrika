module Metrika
  module Helpers
    module Authorization
      DEFAULT_OAUTH_OPTIONS = {
        :site => 'http://api-metrika.yandex.ru',
        :authorize_url => 'https://oauth.yandex.ru/authorize',
        :token_url => 'https://oauth.yandex.ru/token',
        :raise_errors => false
      }      
        
      def authorize_token(auth_code)
        @token = (self.client.auth_code.get_token(auth_code) rescue nil)
      end
      
      def return_token(auth_code)
        (self.client.auth_code.get_token(auth_code) rescue nil)
      end

      def authorization_url
        self.client.auth_code.authorize_url
      end

      def restore_token(access_token)
        @token = OAuth2::AccessToken.new(self.client, access_token)
      end

    protected

      def client
        @client ||= OAuth2::Client.new(@application_id, @application_password, DEFAULT_OAUTH_OPTIONS.dup)
      end

      def token
        raise Metrika::Errors::UnauthorizedError.new("Access token is not initialized") if @token.nil?
        
        @token
      end  
    end
  end
end

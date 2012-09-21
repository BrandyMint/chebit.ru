if defined? Airbrake
   Airbrake.configure do |config|
      config.api_key		 	= '9d6c15c336b28cbb6aac14448670475b'
      config.host			= 'errbit.brandymint.ru'
      config.port			= 80
      config.secure			= config.port == 443
   end
end

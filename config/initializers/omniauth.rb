Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '461059160762612', '4d6f41ffe8a28f2cdd17f91ffaf16516'
end

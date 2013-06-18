require 'onelogin/ruby-saml/settings'
require 'onelogin/ruby-saml/authrequest'
require 'onelogin/ruby-saml/response'

class SamlController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:consume]

  def index
    # insert identity provider discovery logic here
    settings = get_saml_settings
    request = Onelogin::Saml::Authrequest.new
    redirect_to(request.create(settings))
  end

  def consume

    response = Onelogin::Saml::Response.new(params[:SAMLResponse])

    # insert identity provider discovery logic here
    response.settings = get_saml_settings

    logger.info "NAMEID: #{response.name_id}"

    if response.is_valid?
      session[:userid] = response.name_id
      redirect_to '/history/show'
    else
      redirect_to :action => :fail
    end
  end

  def get_saml_settings
    # should retrieve SAML-settings based on subdomain, IP-address, NameID or similar
    settings = Onelogin::Saml::Settings.new


    settings.assertion_consumer_service_url   = 'http://localhost:3000/saml/consume'
    settings.issuer                           = 'http://localhost:3000'
    settings.idp_sso_target_url               = 'https://cbtest.okta.com/home/template_saml_2_0/0oa5jd32ceHSLDKIRBJZ/3079'
    settings.idp_cert_fingerprint             =  '02:05:79:D8:96:CC:CA:54:2F:16: E2:6E:7D:32:F3:54:95:61:89:71'
    settings.name_identifier_format           = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"

    settings
  end

  def complete

  end

  def fail
  end
end

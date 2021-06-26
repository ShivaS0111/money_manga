
// Web environment
// Environment: FLD
// Client ID: b35c6e86c82bf2a1ec044fc221cd2dccf352f05c
// Client Secret: 6ca2239d91cbc7af51473c8b561e3f5083648faf1d924efd6c0b10715a88083b
// Redirect http://localhost/auth_handler.html

const scheme = 'https://';

const base_url = 'brillion.geappliances.com';

const login_production = 'accounts.$base_url';
const login_field = 'accounts-fld.$base_url';

const client_id_production = 'b35c6e86c82bf2a1ec044fc221cd2dccf352f05c';
const client_id_field = 'b35c6e86c82bf2a1ec044fc221cd2dccf352f05c';

const redirect_uri_production = '6830486539696f65687852694d496f6479495a71';
const redirect_uri_field = 'http://localhost:8080/auth_handler.html';

const client_secret_production = '6ca2239d91cbc7af51473c8b561e3f5083648faf1d924efd6c0b10715a88083b';
const client_secret_field = '6ca2239d91cbc7af51473c8b561e3f5083648faf1d924efd6c0b10715a88083b';

const smart_hq_service_home = 'https://smarthqservice.com/';
const smart_hq_service_order = smart_hq_service_home+'#myform';

const content_type = 'application/x-www-form-urlencoded';
const post_token = '/oauth2/token';

String _loginUrl({bool isProduction = false})
  => isProduction?login_production:login_field;

String clientId({bool isProduction = false})
  => isProduction?client_id_production:client_id_field;

String clientSecret({bool isProduction = false})
  => isProduction?client_secret_production:client_secret_field;

String redirectUri({bool isProduction = false})
  => isProduction?redirect_uri_field:redirect_uri_field;

// ignore: prefer_single_quotes
String oauthEnd({bool isProduction = false}) => "$scheme${_loginUrl(isProduction: isProduction)}/oauth2/auth";

//====================================
// TWITCH OAUTH2 TEST

// https://id.twitch.tv/oauth2/authorize
//     ?client_id=<your client ID>
//     &redirect_uri=<your registered redirect URI>
//     &response_type=code
//     &scope=<space-separated list of scopes> // 'user:edit'

const twitch_client_id = 'qxvjbcz9e6haq1kkkjovipx7567dfe';
const twitch_client_secret = 'psw8hox7zfw8gm6aw016l3tapd0tr6';

String twitchOAuthUrl()
  => 'https://id.twitch.tv/oauth2/authorize?client_id=$twitch_client_id'
      '&redirect_uri=${redirectUri(isProduction: false)}'
      '&response_type=code'
      '&scope=viewing_activity_read';
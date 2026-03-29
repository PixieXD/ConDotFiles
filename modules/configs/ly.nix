{ config, ... }:

{
  services.displayManager.ly = {
    settings = {
      allow_empty_password = true;
      animation = "colormix";
      animation_timeout_sec = 0;
      asterisk = "~";
      auth_fails = 10;
      bg = "0x00000000";
      bigclock = "en";
      blank_box = true;
      border_fg = "0x001A0116";
      box_title = null;
      clear_password = true;
      clock = null;
      colormix_col1 = "0x20000000";
      colormix_col2 = "0x00140076";
      colormix_col3 = "0x0068094F";
      error_bg = "0x00000000";
      error_fg = "0x01FF0000";
      fg = "0x001A0116";
      hide_borders = false;
      hide_key_hints = false;
      initial_info_text = ">.<";
      input_len = 34;
      lang = "en";
      load = true;
      login_cmd = null;
      logout_cmd = null;
      margin_box_h = 2;
      margin_box_v = 1;
      min_refresh_delta = 5;
      numlock = true;
    };
  };
}
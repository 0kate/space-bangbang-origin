module SpaceBangBang
  module Config
    Keybinds = [
      # keybinds for controller red
      {
        :key    => K_Z,
        :check  => :key_down?,
        :action => { :type => :move_right,
                     :controller => :red },
      },
      {
        :key    => K_Q,
        :check  => :key_down?,
        :action => { :type => :move_left,
                     :controller => :red },
      },
      {
        :key    => K_X,
        :check  => :key_down?,
        :action => { :type => :turn_right,
                     :controller => :red },
      },
      {
        :key    => K_W,
        :check  => :key_down?,
        :action => { :type => :turn_left,
                     :controller => :red },
      },
      {
        :key    => K_LSHIFT,
        :check  => :key_push?,
        :action => { :type => :shot,
                     :controller => :red },
      },
      # keybinds for controller blue
      {
        :key    => K_DOWN,
        :check  => :key_down?,
        :action => { :type => :move_right,
                     :controller => :blue },
      },
      {
        :key    => K_UP,
        :check  => :key_down?,
        :action => { :type => :move_left,
                     :controller => :blue },
      },
      {
        :key    => K_RIGHT, 
        :check  => :key_down?,
        :action => { :type => :turn_right,
                     :controller => :blue },
      },
      {
        :key    => K_LEFT, 
        :check  => :key_down?,
        :action => { :type => :turn_left,
                     :controller => :blue },
      },
      {
        :key    => K_RETURN, 
        :check  => :key_push?,
        :action => { :type => :shot,
                     :controller => :blue },
      },
      # keybinds for controller green
      {
        :key    => K_B,
        :check  => :key_down?,
        :action => { :type => :move_right,
                     :controller => :green },
      },
      {
        :key    => K_V,
        :check  => :key_down?,
        :action => { :type => :move_left,
                     :controller => :green },
      },
      {
        :key    => K_H,
        :check  => :key_down?,
        :action => { :type => :turn_right,
                     :controller => :green },
      },
      {
        :key    => K_F,
        :check  => :key_down?,
        :action => { :type => :turn_left,
                     :controller => :green },
      },
      {
        :key    => K_SPACE,
        :check  => :key_push?,
        :action => { :type => :shot,
                     :controller => :green },
      },
      # keybinds for controller yellow
    ]
  end
end

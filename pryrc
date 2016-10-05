if Rails.env.development? || Rails.env.test?
  if defined?(PryByebug)
    Pry.commands.alias_command 'c', 'continue'
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'f', 'finish'
  end

  if defined?(Pry)
    Pry::Commands.command(/^$/, 'repeat last command') do
      _pry_.run_command Pry.history.to_a.last
    end
  end
end

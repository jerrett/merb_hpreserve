class MerbHpreserve
  def self.compile_template( path, name, mod )
    template = ::Hpreserve::Parser.new( File.read(path) )
    
    mod.send( :define_method, name,  Proc.new {
     # :TODO: Make this better. It's ugly :(
     # reject merbs @_* instance vars and create a hash of the ones left
     variables = instance_variables.reject { |var| var =~ /^_/ } 
     vars = variables.inject( {} ) do |vars, var| 
       vars[ var.sub('@','').to_s ] = instance_variable_get( var ) 
       vars
     end

     template.render( vars ) 
    })

    name
  end

  module Mixin
  end

  Merb::Template.register_extensions( self, ['htm'] )
end


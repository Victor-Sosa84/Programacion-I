unit UCPersonaje;

interface

Type
  Personaje = Class
     Private

     Public
       function move(key,x,y: integer):integer;
end;

implementation

function Personaje.move(key,x,y: integer):integer;
begin
   case key of
     37: if x>0 then result:=x-68 else result:=x;     //izquierda
     38: if y>0 then result:=y-68 else result:=y;     //arriba
     39: result:=x+68;                                //derecha
     40: result:=y+68;                                //abajo
   end;
end;

end.

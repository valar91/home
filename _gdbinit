set auto-load safe-path /

define luadump
	set $p = &L->base_ci
	while ($p != L->ci )
	  if ( $p->func->value_.gc->cl.c.isC == 1 )
	    printf "0x%x   C FUNCTION", $p
	    output $p->func->value_.gc->cl.c.f
	    printf "\n"
	  else
	    if ($p->func.tt==6)
	      set $proto = $p->func->value_.gc->cl.l.p
	      set $filename = (char*)(&($proto->source->tsv) + 1)
	      set $lineno = $proto->lineinfo[ $p->savedpc - $proto->code -1 ]
	      printf "0x%x LUA FUNCTION : %d %s\n", $p, $lineno, $filename
	    else
	      printf "0x%x LUA BASE\n", $p
	    end
	  end
	  set $p = $p+1
	end
end
document luadump
	see http://stackoverflow.com/questions/8528503/how-can-i-get-the-lua-stack-trace-from-a-core-file-using-gdb
end


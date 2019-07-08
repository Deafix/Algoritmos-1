function checkMousePos(mouseX, mouseY, objX, objY, objW, objH)
	if (mouseY >= objY and mouseY <= objY + objH) and
		(mouseX >= objX and mouseX <= objX + objW) then
		return true
	else
		return false
	end
end

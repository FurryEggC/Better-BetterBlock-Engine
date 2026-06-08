#Requires AutoHotkey v2.0

; ========== Direction State Class ==========
class DirectionState {
    value := 0
    modulo := 0
    names := []

    __New(modulo, names*) {
        this.modulo := modulo
        this.names := names
    }

    GetName() {
        if this.modulo <= 1
            return ""
        return this.names[Mod(this.value, this.modulo) + 1]
    }

    Next() {
        if this.modulo > 1
            this.value := Mod(this.value + 1, this.modulo)
    }

    GetOffset(gap) {
        return Mod(this.value, this.modulo) * gap
    }
}

; ========== Global Variable Segment ==========
Global GAP := 44
Global HoverDelay := 20
Global SlotYBegin := -22  ; original 285
Global BeginSlot := 3

; Every Slot: [slotCount, tagName, DirectionState(slot, *names)]
Global YourSlotConfig := [
	
]

; Slot Example
Global NewYear2027 := [
    [1, "Block", DirectionState(1)],
    [4, "Spike", DirectionState(4, "Up", "Right", "Down", "Left")],
    [4, "Mini",  DirectionState(4, "Up", "Right", "Down", "Left")],
    [1, "Cherry", DirectionState(1)],
	[3, "Water", DirectionState(3, "0", "2", "3")],
	[2, "Vine", DirectionState(2, "Right", "Left")],
	[2, "Platform", DirectionState(2, "", "Flip")],
	[1, "Refresher", DirectionState(1)],
	[2, "Save", DirectionState(2, "", "Blocker")],
]

; Using Items Below
Global Items := NewYear2027

; ========== Pre-process Segment ==========
Global SlotsOffset := [BeginSlot * GAP]
sum := BeginSlot * GAP
for item in Items {
    sum += item[1] * GAP   ; item[1]: count
    SlotsOffset.Push(sum)
}

; ========== Function Segment ==========
MoveAndClick(x, y, delay := HoverDelay) {
    MouseMove(x, y)
    Click()
    Sleep(delay)
}

ClickBoard() {
    MoveAndClick(100, 300)
}

WithMouseRestore(action) {
    MouseGetPos(&startX, &startY)
    action()
    MouseMove(startX, startY)
}

ShowHint(text) {
    ToolTip(text)
    SetTimer(() => ToolTip(), -500)
}

DoAction(idx, item) {
	BlockInput true
	try {
		baseY := SlotYBegin + SlotsOffset[idx]
		y := baseY + item[3].GetOffset(GAP)   ; item[3]: state
		hintText := item[2]                   ; item[2]: tag
		dirName := item[3].GetName()
		if dirName != ""
			if hintText != ""
				hintText .= " " . dirName
			else hintText := dirName
		ShowHint(hintText)
		ClickBoard()
		MoveAndClick(250, y)
		item[3].Next()
	} finally {
        BlockInput false
    }
}

; ========== Hotkey Registration ==========
RegisterHotkey(key, idx, item) {
    Hotkey(key, (*) => WithMouseRestore(() => DoAction(idx, item)))
}

Loop Items.Length {
    RegisterHotkey("F" . A_Index, A_Index, Items[A_Index])
}


local Players = game:GetService("Players")

Neverlose = {}
drawings = {}
local tabs = {}
ActiveKeybinds = {}
ActiveNotifications = {}
local OpenDropdown = nil

local themes = {
    Original = {
        Background = Color3.fromRGB(1, 17, 33),
        Section = Color3.fromRGB(0, 17, 35),
        Accent = Color3.fromRGB(19, 176, 243),
        Outline = Color3.fromRGB(3, 35, 50),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(140, 140, 140),
        Button = Color3.fromRGB(2, 5, 22)
    },
    Nightly = {
        Background = Color3.fromRGB(43, 43, 43),
        Section = Color3.fromRGB(26, 26, 26),
        Accent = Color3.fromRGB(255, 140, 0),
        Outline = Color3.fromRGB(50, 50, 50),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(140, 140, 140),
        Button = Color3.fromRGB(26, 26, 26)
    },
    Dark = {
        Background = Color3.fromRGB(37, 37, 37),
        Section = Color3.fromRGB(13, 13, 13),
        Accent = Color3.fromRGB(0, 172, 247),
        Outline = Color3.fromRGB(28, 28, 28),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(140, 140, 140),
        Button = Color3.fromRGB(13, 13, 13)
    },
    Default = {
        Background = Color3.fromRGB(1, 17, 33),
        Section = Color3.fromRGB(0, 17, 35),
        Accent = Color3.fromRGB(19, 176, 243),
        Outline = Color3.fromRGB(3, 35, 50),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(140, 140, 140),
        Button = Color3.fromRGB(2, 5, 22)
    },
    Dracula = {
        Background = Color3.fromRGB(40, 42, 54),
        Section = Color3.fromRGB(52, 55, 70),
        Accent = Color3.fromRGB(189, 147, 249),
        Outline = Color3.fromRGB(68, 71, 90),
        Text = Color3.fromRGB(248, 248, 242),
        TextDark = Color3.fromRGB(98, 114, 164),
        Button = Color3.fromRGB(68, 71, 90)
    },
    Catppuccin = {
        Background = Color3.fromRGB(30, 30, 46),
        Section = Color3.fromRGB(49, 50, 68),
        Accent = Color3.fromRGB(203, 166, 247),
        Outline = Color3.fromRGB(88, 91, 112),
        Text = Color3.fromRGB(205, 214, 244),
        TextDark = Color3.fromRGB(166, 173, 200),
        Button = Color3.fromRGB(69, 71, 90)
    },
    Gruvbox = {
        Background = Color3.fromRGB(40, 40, 40),
        Section = Color3.fromRGB(50, 48, 47),
        Accent = Color3.fromRGB(214, 93, 14),
        Outline = Color3.fromRGB(60, 56, 54),
        Text = Color3.fromRGB(235, 219, 178),
        TextDark = Color3.fromRGB(146, 131, 116),
        Button = Color3.fromRGB(80, 73, 69)
    },
    Nord = {
        Background = Color3.fromRGB(46, 52, 64),
        Section = Color3.fromRGB(59, 66, 82),
        Accent = Color3.fromRGB(136, 192, 208),
        Outline = Color3.fromRGB(76, 86, 106),
        Text = Color3.fromRGB(236, 239, 244),
        TextDark = Color3.fromRGB(216, 222, 233),
        Button = Color3.fromRGB(67, 76, 94)
    },
    TokyoNight = {
        Background = Color3.fromRGB(26, 27, 38),
        Section = Color3.fromRGB(36, 40, 59),
        Accent = Color3.fromRGB(122, 162, 247),
        Outline = Color3.fromRGB(65, 72, 104),
        Text = Color3.fromRGB(192, 202, 245),
        TextDark = Color3.fromRGB(86, 95, 137),
        Button = Color3.fromRGB(59, 66, 97)
    },
    OneDark = {
        Background = Color3.fromRGB(40, 44, 52),
        Section = Color3.fromRGB(44, 50, 60),
        Accent = Color3.fromRGB(97, 175, 239),
        Outline = Color3.fromRGB(61, 67, 80),
        Text = Color3.fromRGB(171, 178, 191),
        TextDark = Color3.fromRGB(92, 99, 112),
        Button = Color3.fromRGB(53, 59, 69)
    },
    RosePine = {
        Background = Color3.fromRGB(25, 23, 36),
        Section = Color3.fromRGB(31, 29, 46),
        Accent = Color3.fromRGB(235, 188, 186),
        Outline = Color3.fromRGB(64, 61, 82),
        Text = Color3.fromRGB(224, 222, 244),
        TextDark = Color3.fromRGB(144, 140, 170),
        Button = Color3.fromRGB(42, 40, 62)
    },
    Synthwave84 = {
        Background = Color3.fromRGB(38, 35, 53),
        Section = Color3.fromRGB(45, 41, 65),
        Accent = Color3.fromRGB(255, 122, 215),
        Outline = Color3.fromRGB(104, 82, 126),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(174, 133, 223),
        Button = Color3.fromRGB(55, 50, 75)
    },
    SolarizedDark = {
        Background = Color3.fromRGB(0, 43, 54),
        Section = Color3.fromRGB(7, 54, 66),
        Accent = Color3.fromRGB(38, 139, 210),
        Outline = Color3.fromRGB(88, 110, 117),
        Text = Color3.fromRGB(147, 161, 161),
        TextDark = Color3.fromRGB(101, 123, 131),
        Button = Color3.fromRGB(0, 43, 54)
    },
    Everforest = {
        Background = Color3.fromRGB(43, 51, 57),
        Section = Color3.fromRGB(51, 59, 64),
        Accent = Color3.fromRGB(167, 192, 128),
        Outline = Color3.fromRGB(74, 82, 87),
        Text = Color3.fromRGB(211, 198, 170),
        TextDark = Color3.fromRGB(122, 132, 122),
        Button = Color3.fromRGB(58, 66, 71)
    },
    Midnight = {
        Background = Color3.fromRGB(10, 10, 15),
        Section = Color3.fromRGB(15, 15, 25),
        Accent = Color3.fromRGB(0, 120, 255),
        Outline = Color3.fromRGB(30, 30, 50),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(100, 100, 150),
        Button = Color3.fromRGB(20, 20, 35)
    }
}

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function lerp(a, b, t)
    if not a or not b or not t then return 0 end
    return a * (1 - t) + b * t
end

local function clamp(x, a, b)
    if x > b then return b elseif x < a then return a else return x end
end

local function lerpColor(c1, c2, t)
    return Color3.new(
        lerp(c1.R, c2.R, t),
        lerp(c1.G, c2.G, t),
        lerp(c1.B, c2.B, t)
    )
end

local function Insert(t, v)
    table.insert(t, v)
end

function Neverlose:AddTheme(name, config)
    themes[name] = config
end

local function Draw(t, props)
    local o = Drawing.new(t)
    for k, v in pairs(props) do
        o[k] = v
    end
    Insert(drawings, o)
    return o
end


-- Sorry for leaking the method guys mwahahahahahhaha
local function createGlow(obj, size, pos, corner, spread, color)
    local layers = {}
    for i = 1, spread do
        local glow = Drawing.new("Square")
        glow.Visible = obj.Visible
        glow.Filled = false
        glow.Thickness = 1.5
        glow.Transparency = 0.2 * (1 - (i / spread))
        glow.Color = color
        glow.Size = size + Vector2.new(i * 4, i * 4)
        glow.Position = pos - Vector2.new(i * 2, i * 2)
        glow.Corner = corner + i
        layers[i] = glow
        Insert(drawings, glow)
    end
    return layers
end

local function getMousePos()
    return Vector2.new(Mouse.X, Mouse.Y)
end

local function isMouseOver(pos, size)
    local m = getMousePos()
    return m.X >= pos.X and m.X <= pos.X + size.X
    and m.Y >= pos.Y and m.Y <= pos.Y + size.Y
end

local KeyCodeNames = {
    ["None"] = 0, ["Enter"] = 0x0D, ["Space"] = 0x20, ["Backspace"] = 0x08,
    ["0"] = 0x30, ["1"] = 0x31, ["2"] = 0x32, ["3"] = 0x33, ["4"] = 0x34, 
    ["5"] = 0x35, ["6"] = 0x36, ["7"] = 0x37, ["8"] = 0x38, ["9"] = 0x39,
    ["A"] = 0x41, ["B"] = 0x42, ["C"] = 0x43, ["D"] = 0x44, ["E"] = 0x45, 
    ["F"] = 0x46, ["G"] = 0x47, ["H"] = 0x48, ["I"] = 0x49, ["J"] = 0x4A, 
    ["K"] = 0x4B, ["L"] = 0x4C, ["M"] = 0x4D, ["N"] = 0x4E, ["O"] = 0x4F, 
    ["P"] = 0x50, ["Q"] = 0x51, ["R"] = 0x52, ["S"] = 0x53, ["T"] = 0x54, 
    ["U"] = 0x55, ["V"] = 0x56, ["W"] = 0x57, ["X"] = 0x58, ["Y"] = 0x59, ["Z"] = 0x5A,
    ["Insert"] = 0x2D, ["Delete"] = 0x2E, ["Home"] = 0x24, ["End"] = 0x23, ["PageUp"] = 0x21, ["PageDown"] = 0x22,
    ["F1"] = 0x70, ["F2"] = 0x71, ["F3"] = 0x72, ["F4"] = 0x73, ["F5"] = 0x74, ["F6"] = 0x75, ["F7"] = 0x76, ["F8"] = 0x77, ["F9"] = 0x78, ["F10"] = 0x79, ["F11"] = 0x7A, ["F12"] = 0x7B
}

local ReverseKeyCodeNames = {}
for k, v in pairs(KeyCodeNames) do ReverseKeyCodeNames[v] = k end

local function GetKeyName(kc)
    return ReverseKeyCodeNames[kc] or "Key: " .. tostring(kc)
end

function Neverlose:Notify(title, text, duration)
    spawn(function()
        local theme = themes.Default
        local duration = duration or 5
        local id = {}
        
        local function wrapText(str, limit)
            local res = ""
            for i = 1, #str do
                res = res .. str:sub(i, i)
                if i > 0 and i % limit == 0 then res = res .. "\n" end
            end
            return res
        end

        local processedText = wrapText(text, 35)
        
        local elements = {
            Outline = Draw("Square", {Size = Vector2.new(208, 64), Color = theme.Accent, Filled = true, ZIndex = 2000, Visible = true}),
            Background = Draw("Square", {Size = Vector2.new(204, 60), Color = theme.Background, Filled = true, ZIndex = 2001, Visible = true}),
            Title = Draw("Text", {Text = title, Size = 16, Color = theme.Accent, Font = 2, ZIndex = 2002, Visible = true}),
            Text = Draw("Text", {Text = processedText, Size = 14, Color = theme.Text, Font = 2, ZIndex = 2002, Visible = true}),
            BarBG = Draw("Square", {Size = Vector2.new(190, 2), Color = theme.Accent, Transparency = 0.3, Filled = true, ZIndex = 2002, Visible = true}),
            Bar = Draw("Square", {Size = Vector2.new(190, 2), Color = theme.Accent, Filled = true, ZIndex = 2003, Visible = true})
        }

        local data = {ID = id, Elements = elements}
        table.insert(ActiveNotifications, data)

        local elapsed = 0
        while elapsed < duration do
            local waitTime = task.wait(0.03) or 0.03
            elapsed = elapsed + waitTime
            
            local percent = clamp(1 - (elapsed / duration), 0, 1)
            
            local index = 0
            for i, v in ipairs(ActiveNotifications) do
                if v.ID == id then index = i break end
            end

            if index > 0 then
                local screenWidth = 1920
                local screenHeight = 1080

                local targetY = screenHeight - 80 - ((index - 1) * 75)
                local targetPos = Vector2.new(screenWidth - 220, targetY)

                elements.Outline.Position = targetPos - Vector2.new(2, 2)
                elements.Background.Position = targetPos
                elements.Title.Position = targetPos + Vector2.new(8, 5)
                elements.Text.Position = targetPos + Vector2.new(8, 25)
                elements.BarBG.Position = targetPos + Vector2.new(8, 52)
                elements.Bar.Position = targetPos + Vector2.new(8, 52)
                elements.Bar.Size = Vector2.new(190 * percent, 2)
            end
        end
        
        for i, v in ipairs(ActiveNotifications) do
            if v.ID == id then table.remove(ActiveNotifications, i) break end
        end
        for _, el in pairs(elements) do el:Remove() end
    end)
end

function Neverlose:Log(text, duration)
    spawn(function()
        local theme = themes.Default
        local duration = duration or 5
        local id = {}
        
        local elements = {
            Outline = Drawing.new("Square"),
            Background = Drawing.new("Square"),
            Bar = Drawing.new("Square"),
            Text = Drawing.new("Text")
        }

        elements.Outline.Size = Vector2.new(350, 26)
        elements.Outline.Color = theme.Accent
        elements.Outline.Filled = true
        elements.Outline.ZIndex = 2010
        elements.Outline.Visible = false

        elements.Background.Size = Vector2.new(348, 24)
        elements.Background.Color = theme.Background
        elements.Background.Filled = true
        elements.Background.ZIndex = 2011
        elements.Background.Visible = false

        elements.Bar.Size = Vector2.new(4, 24)
        elements.Bar.Color = theme.Accent
        elements.Bar.Filled = true
        elements.Bar.ZIndex = 2012
        elements.Bar.Visible = false

        elements.Text.Text = text
        elements.Text.Size = 13
        elements.Text.Color = theme.Text
        elements.Text.Font = Drawing.Fonts.System
        elements.Text.ZIndex = 2020
        elements.Text.Visible = false

        local data = {ID = id, Elements = elements}
        table.insert(ActiveNotifications, data)

        local elapsed = 0
        local animProgress = 0

        while elapsed < duration do
            local dt = wait() or 0.03
            elapsed = elapsed + dt
            
            if animProgress < 1 then
                animProgress = math.min(animProgress + (dt * 1.0), 1)
            end

            local alpha = animProgress
            if duration - elapsed < 0.5 then
                alpha = math.max((duration - elapsed) / 0.5, 0)
            end

            local index = 0
            for i, v in ipairs(ActiveNotifications) do
                if v.ID == id then index = i break end
            end

            if index > 0 then
                if alpha > 0 and not elements.Outline.Visible then
                    elements.Outline.Visible = true
                    elements.Background.Visible = true
                    elements.Bar.Visible = true
                    elements.Text.Visible = true
                end

                local slideOffset = (1 - animProgress) * -400
                local targetX = 20 + slideOffset
                local targetY = 50 + ((index - 1) * 30)
                local targetPos = Vector2.new(targetX, targetY)

                elements.Outline.Position = targetPos - Vector2.new(1, 1)
                elements.Background.Position = targetPos
                elements.Bar.Position = targetPos
                elements.Text.Position = targetPos + Vector2.new(10, 5)
                
                elements.Outline.Transparency = alpha * 0.6
                elements.Background.Transparency = alpha
                elements.Bar.Transparency = alpha
                elements.Text.Transparency = alpha
            end
        end
        
        for i, v in ipairs(ActiveNotifications) do
            if v.ID == id then table.remove(ActiveNotifications, i) break end
        end
        
        elements.Outline:Remove()
        elements.Background:Remove()
        elements.Bar:Remove()
        elements.Text:Remove()
    end)
end

local KeybindList = {
    CurrentTransparency = 0,
    TargetHeight = 25,
    CurrentHeight = 25,
    Entries = {},
    MainFrame = Draw("Square", {
        Filled = true,
        Color = themes.Default.Background,
        Size = Vector2.new(150, 25),
        Position = Vector2.new(20, 300),
        Visible = false,
        Corner = 4,
        Transparency = 0,
        ZIndex = 100
    }),
    Title = Draw("Text", {
        Text = "Keybinds",
        Size = 14,
        Color = themes.Default.Accent,
        Position = Vector2.new(25, 305),
        Font = 2,
        Visible = false,
        Transparency = 0,
        ZIndex = 101
    })
}

KeybindList.Glow = createGlow(KeybindList.MainFrame, KeybindList.MainFrame.Size, KeybindList.MainFrame.Position, 4, 10, themes.Default.Accent)

function Neverlose:UpdateKeybindList()
    local activeData = {}
    for name, mode in pairs(ActiveKeybinds) do
        table.insert(activeData, {Name = name, Mode = mode})
    end
    
    local activeCount = #activeData
    KeybindList.TargetHeight = 25 + (activeCount * 18) + (activeCount > 0 and 5 or 0)
    
    local alpha = KeybindList.CurrentTransparency
    local shouldShow = alpha > 0.05

    KeybindList.MainFrame.Visible = shouldShow
    KeybindList.Title.Visible = shouldShow
    KeybindList.MainFrame.Transparency = alpha
    KeybindList.Title.Transparency = alpha
    
    KeybindList.CurrentHeight = lerp(KeybindList.CurrentHeight, KeybindList.TargetHeight, 0.15)
    KeybindList.MainFrame.Size = Vector2.new(150, KeybindList.CurrentHeight)

    for i, glow in ipairs(KeybindList.Glow) do
        glow.Visible = shouldShow
        glow.Transparency = (0.2 * (1 - (i / 10))) * alpha
        glow.Size = KeybindList.MainFrame.Size + Vector2.new(i * 4, i * 4)
        glow.Position = KeybindList.MainFrame.Position - Vector2.new(i * 2, i * 2)
    end

    for i, entry in ipairs(KeybindList.Entries) do
        local isEntryActive = i <= activeCount
        entry.Text.Visible = shouldShow and isEntryActive
        entry.Mode.Visible = shouldShow and isEntryActive
        
        if isEntryActive then
            entry.CurrentAlpha = lerp(entry.CurrentAlpha, 1, 0.1)
        else
            entry.CurrentAlpha = lerp(entry.CurrentAlpha, 0, 0.1)
        end
        
        entry.Text.Transparency = alpha * entry.CurrentAlpha
        entry.Mode.Transparency = alpha * entry.CurrentAlpha
    end

    if not shouldShow then return end

    local yOffset = 25
    for i, data in ipairs(activeData) do
        local entry = KeybindList.Entries[i]
        if not entry then
            entry = {
                Text = Draw("Text", { Size = 13, Color = themes.Default.Text, Font = 2, Visible = false, ZIndex = 102 }),
                Mode = Draw("Text", { Size = 13, Color = themes.Default.TextDark, Font = 2, Visible = false, ZIndex = 102 }),
                CurrentAlpha = 0
            }
            KeybindList.Entries[i] = entry
        end

        entry.Text.Text = data.Name
        entry.Mode.Text = "[" .. data.Mode .. "]"
        
        entry.Text.Position = KeybindList.MainFrame.Position + Vector2.new(10, yOffset)
        entry.Mode.Position = KeybindList.MainFrame.Position + Vector2.new(140 - entry.Mode.TextBounds.X, yOffset)
        
        yOffset = yOffset + 18
    end
end

spawn(function()
    while true do
        local activeCount = 0
        for _ in pairs(ActiveKeybinds) do activeCount = activeCount + 1 end
        local target = (activeCount > 0 or Neverlose.IsOpen) and 1 or 0
        
        KeybindList.CurrentTransparency = lerp(KeybindList.CurrentTransparency, target, 0.1)
        Neverlose:UpdateKeybindList()
        wait(0.01)
    end
end)

function Neverlose:CreateWindow(Title, Size, ThemeName)
    local theme = themes[ThemeName] or themes.Original
    local windowSize = Size or Vector2.new(650, 450)
    local screenPos = Vector2.new(200, 200)

    local main = Draw("Square", { Filled = true, Color = theme.Background, Size = windowSize, Position = screenPos, Corner = 4, Visible = true, ZIndex = 1 })
    local sidebar = Draw("Square", { Filled = true, Color = theme.Section, Size = Vector2.new(150, windowSize.Y), Position = screenPos, Corner = 4, Visible = true, ZIndex = 2 })
    local logo = Draw("Text", { Text = Title or "Neverlose", Size = 24, Color = theme.Accent, Position = screenPos + Vector2.new(25, 20), Font = 2, Visible = true, ZIndex = 3 })
    local globalSelector = Draw("Square", { Filled = true, Color = theme.Accent, Size = Vector2.new(3, 18), Position = screenPos + Vector2.new(0, 70), Visible = true, ZIndex = 5 })

    local window = {
        Main = main, Sidebar = sidebar, Logo = logo, GlobalSelector = globalSelector,
        Pos = screenPos, Size = windowSize, Theme = theme, Sections = {}, CurrentTab = "",
        SidebarItems = {}, SidebarLayoutY = 70, SidebarPadding = 6, TargetSelectorY = 70, CurrentSelectorY = 70,
        TabSections = {}
    }

    window.Glow = createGlow(main, windowSize, screenPos, 4, 10, theme.Accent)
    
    Neverlose.IsOpen = true

    function window:SetVisible(state)
        Neverlose.IsOpen = state
        self.Main.Visible = state
        self.Sidebar.Visible = state
        self.Logo.Visible = state
        self.GlobalSelector.Visible = state
        for _, glow in ipairs(self.Glow) do glow.Visible = state end
        for _, item in ipairs(self.SidebarItems) do if item.Text then item.Text.Visible = state end end
        self:UpdateVisibility()
    end

    function window:Move(delta)
        self.Pos = self.Pos + delta
        self.Main.Position = self.Main.Position + delta
        self.Sidebar.Position = self.Sidebar.Position + delta
        self.Logo.Position = self.Logo.Position + delta
        self.GlobalSelector.Position = self.GlobalSelector.Position + delta
        for i, glow in ipairs(self.Glow) do
            glow.Position = self.Main.Position - Vector2.new(i * 2, i * 2)
        end
        for _, item in ipairs(self.SidebarItems) do item:_Move(delta) end
        self:RelayoutTab(self.CurrentTab)
    end

    function window:CreateTabSection(text)
        local y = self.SidebarLayoutY
        self.SidebarLayoutY = self.SidebarLayoutY + 24
        local label = Draw("Text", { Text = text, Size = 13, Color = Color3.fromRGB(255, 255, 255), Position = self.Pos + Vector2.new(25, y), Font = 2, Visible = true, ZIndex = 4 })
        local tabSection = { Text = label, _Move = function(_, d) label.Position = label.Position + d end }
        Insert(self.SidebarItems, tabSection)
        self.TabSections[text] = tabSection
        return tabSection
    end

    function window:CreateTab(Name)
        local height = 30
        local y = self.SidebarLayoutY
        self.SidebarLayoutY = self.SidebarLayoutY + height + self.SidebarPadding
        local pos = self.Pos + Vector2.new(0, y)
        local text = Draw("Text", { Text = Name, Size = 14, Color = theme.TextDark, Position = pos + Vector2.new(35, 6), Font = 2, Visible = true, ZIndex = 4 })
        local tab = { Name = Name, Position = pos, Size = Vector2.new(150, height), Text = text, RelativeY = y + 6 }
        function tab:_Move(d) self.Position = self.Position + d; self.Text.Position = self.Text.Position + d end
        Insert(self.SidebarItems, tab)
        Insert(tabs, tab)
        if self.CurrentTab == "" then self.CurrentTab = Name; text.Color = theme.Text; self.TargetSelectorY = tab.RelativeY; self.CurrentSelectorY = tab.RelativeY end
        return tab
    end

    function window:UpdateVisibility()
        for _, s in ipairs(self.Sections) do
            local isVisible = (s.Tab == self.CurrentTab) and Neverlose.IsOpen
            s.Frame.Visible = isVisible
            s.Title.Visible = isVisible
            for _, item in ipairs(s.ContentDrawings) do 
                if item.Type == "PickerPart" or item.Type == "DropdownPart" then
                    item.Obj.Visible = false
                else
                    item.Obj.Visible = isVisible
                end
            end
        end
        OpenDropdown = nil
        self:RelayoutTab(self.CurrentTab)
    end

    function window:CreateSection(Name, TabName)
        local section = { Frame = nil, Title = nil, Tab = TabName, Name = Name, ContentDrawings = {}, InternalY = 5, Width = 220 }
        section.Frame = Draw("Square", { Filled = true, Color = theme.Section, Size = Vector2.new(220, 25), Corner = 8, Visible = (TabName == self.CurrentTab), ZIndex = 10 })
        section.Title = Draw("Text", { Text = Name, Size = 14, Color = theme.TextDark, Font = 2, Visible = (TabName == self.CurrentTab), ZIndex = 11 })

        function section:AddLabel(text)
            local label = Draw("Text", { Text = text, Size = 14, Color = theme.Text, Font = 2, Visible = self.Frame.Visible, ZIndex = 12 })
            Insert(self.ContentDrawings, {Obj = label, Type = "Label", Height = 18})
            self.InternalY = self.InternalY + 18
            window:RelayoutTab(self.Tab)
            return label
        end

        function section:AddToggle(text, default, callback)
            local toggle = {Value = default or false, Callback = callback}
            local boxFrame = Draw("Square", { Filled = true, Color = theme.Button, Size = Vector2.new(22, 22), Corner = 4, Visible = self.Frame.Visible, ZIndex = 12 })
            local check = Draw("Square", { Filled = true, Color = theme.Accent, Size = Vector2.new(12, 12), Corner = 2, Visible = false, ZIndex = 13 })
            local label = Draw("Text", { Text = text, Size = 14, Color = theme.Text, Font = 2, Visible = self.Frame.Visible, ZIndex = 12 })
            Insert(self.ContentDrawings, {Obj = label, Type = "Label", Height = 24})
            Insert(self.ContentDrawings, {Obj = boxFrame, Type = "ToggleFrame", Height = 0})
            Insert(self.ContentDrawings, {Obj = check, Type = "Ignore"})
            
            function toggle:SetValue(val)
                self.Value = val
                check.Visible = self.Value and section.Frame.Visible and Neverlose.IsOpen
                check.Position = boxFrame.Position + Vector2.new(5, 5)
                self.Callback(self.Value)
            end
            function toggle:GetValue() return self.Value end

            spawn(function()
                local wasDown = false
                while true do
                    if section.Frame.Visible and window.CurrentTab == section.Tab and Neverlose.IsOpen then
                        local over = isMouseOver(boxFrame.Position, boxFrame.Size)
                        local down = ismouse1pressed()
                        if not OpenDropdown and over and down and not wasDown then
                            toggle:SetValue(not toggle.Value)
                            wait(0.1)
                        end
                        wasDown = down
                        check.Visible = toggle.Value and section.Frame.Visible and Neverlose.IsOpen
                        check.Position = boxFrame.Position + Vector2.new(5, 5)
                    else
                        check.Visible = false
                    end
                    wait()
                end
            end)
            toggle:SetValue(toggle.Value)
            section.InternalY = section.InternalY + 24; window:RelayoutTab(section.Tab)
            return toggle
        end

        function section:AddTextBox(text, default, callback)
            local box = {Value = default or "", Callback = callback}
            local label = Draw("Text", { Text = text, Size = 14, Color = theme.Text, Font = 2, Visible = self.Frame.Visible, ZIndex = 12 })
            local boxFrame = Draw("Square", { Filled = true, Color = theme.Button, Size = Vector2.new(section.Width - 20, 22), Corner = 4, Visible = self.Frame.Visible, ZIndex = 12 })
            local boxText = Draw("Text", { Text = box.Value, Size = 14, Color = theme.TextDark, Center = true, Font = 2, Visible = self.Frame.Visible, ZIndex = 13 })
            local active = false
            Insert(self.ContentDrawings, {Obj = label, Type = "Label", Height = 18})
            Insert(self.ContentDrawings, {Obj = boxFrame, Type = "ButtonFrame", Height = 26})
            Insert(self.ContentDrawings, {Obj = boxText, Type = "ButtonText", Center = true})
            
            function box:SetValue(val)
                self.Value = val
                boxText.Text = self.Value
                self.Callback(self.Value)
            end
            function box:GetValue() return self.Value end

            spawn(function()
                local wasM1 = false
                local wasPressed = {}
                while true do
                    if section.Frame.Visible and window.CurrentTab == section.Tab and Neverlose.IsOpen then
                        local m1 = ismouse1pressed()
                        if not OpenDropdown and m1 and not wasM1 then
                            active = isMouseOver(boxFrame.Position, boxFrame.Size)
                            boxFrame.Color = active and theme.Section or theme.Button
                            boxText.Color = active and theme.Text or theme.TextDark
                        end
                        wasM1 = m1
                        if active then
                            for name, kc in pairs(KeyCodeNames) do
                                local down = iskeypressed(kc)
                                if down and not wasPressed[kc] then
                                    if kc == 0x08 then 
                                        box.Value = box.Value:sub(1, #box.Value - 1)
                                    elseif kc == 0x0D then
                                        active = false
                                        boxFrame.Color = theme.Button
                                        boxText.Color = theme.TextDark
                                        box.Callback(box.Value)
                                    elseif #name == 1 or name == "Space" then
                                        local char = (name == "Space" and " " or name)
                                        if iskeypressed(0x10) then char = char:upper() else char = char:lower() end
                                        box.Value = box.Value .. char
                                    end
                                    boxText.Text = box.Value
                                end
                                wasPressed[kc] = down
                            end
                        end
                    end
                    wait()
                end
            end)
            section.InternalY = section.InternalY + 44; window:RelayoutTab(section.Tab)
            return box
        end

        function section:AddButton(text, callback)
            local btnFrame = Draw("Square", { Filled = true, Color = theme.Button, Size = Vector2.new(self.Width - 20, 22), Corner = 4, Visible = self.Frame.Visible, ZIndex = 12 })
            local btnText = Draw("Text", { Text = text, Size = 14, Color = theme.Text, Center = true, Font = 2, Visible = self.Frame.Visible, ZIndex = 13 })
            Insert(self.ContentDrawings, {Obj = btnFrame, Type = "ButtonFrame", Height = 26}); Insert(self.ContentDrawings, {Obj = btnText, Type = "ButtonText", Center = true})
            spawn(function()
                local wasDown = false
                while true do
                    if section.Frame.Visible and window.CurrentTab == section.Tab and Neverlose.IsOpen then
                        local over = isMouseOver(btnFrame.Position, btnFrame.Size)
                        local down = ismouse1pressed()
                        if not OpenDropdown and over then
                            btnFrame.Color = lerpColor(theme.Button, theme.Accent, 0.2)
                            if down and not wasDown then callback(); btnFrame.Color = theme.Accent; wait(0.1) end
                        else btnFrame.Color = theme.Button end
                        wasDown = down
                    end
                    wait()
                end
            end)
            section.InternalY = section.InternalY + 26; window:RelayoutTab(section.Tab)
            return {Frame = btnFrame, Text = btnText}
        end

        function section:AddSlider(text, options)
            local slider = {Value = options.Default or 0, Min = options.Min or 0, Max = options.Max or 100, Callback = options.Callback}
            local label = Draw("Text", { Text = text, Size = 14, Color = theme.Text, Font = 2, Visible = self.Frame.Visible, ZIndex = 12 })
            local backFrame = Draw("Square", { Filled = true, Color = theme.Button, Size = Vector2.new(section.Width - 20, 16), Corner = 4, Visible = self.Frame.Visible, ZIndex = 12 })
            local fillFrame = Draw("Square", { Filled = true, Color = theme.Accent, Size = Vector2.new(0, 16), Corner = 4, Visible = self.Frame.Visible, ZIndex = 13 })
            local valueText = Draw("Text", { Text = tostring(slider.Value), Size = 14, Color = theme.Text, Center = true, Font = 2, Visible = self.Frame.Visible, ZIndex = 14 })
            Insert(self.ContentDrawings, {Obj = label, Type = "Label", Height = 18}); Insert(self.ContentDrawings, {Obj = backFrame, Type = "SliderFrame", Height = 20}); Insert(self.ContentDrawings, {Obj = fillFrame, Type = "Ignore"}); Insert(self.ContentDrawings, {Obj = valueText, Type = "Ignore"})
            
            function slider:SetValue(val)
                self.Value = math.clamp(val, self.Min, self.Max)
                local percent = (self.Value - self.Min) / (self.Max - self.Min)
                fillFrame.Size = Vector2.new(backFrame.Size.X * percent, backFrame.Size.Y)
                valueText.Text = tostring(self.Value)
                self.Callback(self.Value)
            end
            function slider:GetValue() return self.Value end

            spawn(function()
                local dragging = false
                while true do
                    if section.Frame.Visible and window.CurrentTab == section.Tab and Neverlose.IsOpen then
                        local down = ismouse1pressed()
                        if not OpenDropdown and isMouseOver(backFrame.Position, backFrame.Size) and down then dragging = true end
                        if not down then dragging = false end
                        if dragging then
                            local percent = math.clamp((getMousePos().X - backFrame.Position.X) / backFrame.Size.X, 0, 1)
                            slider:SetValue(math.floor(slider.Min + (slider.Max - slider.Min) * percent))
                        end
                        fillFrame.Position = backFrame.Position
                        fillFrame.Visible = section.Frame.Visible and Neverlose.IsOpen
                        valueText.Position = backFrame.Position + Vector2.new(backFrame.Size.X/2, (backFrame.Size.Y/2))
                        valueText.Visible = section.Frame.Visible and Neverlose.IsOpen
                    else
                        fillFrame.Visible = false
                        valueText.Visible = false
                    end
                    wait()
                end
            end)
            slider:SetValue(slider.Value)
            section.InternalY = section.InternalY + 38; window:RelayoutTab(section.Tab)
            return slider
        end

        function section:AddDualSlider(text, options)
            local slider = {Low = options.DefaultLow or options.Min or 0, High = options.DefaultHigh or options.Max or 100, Min = options.Min or 0, Max = options.Max or 100, Callback = options.Callback}
            local label = Draw("Text", { Text = text, Size = 14, Color = theme.Text, Font = 2, Visible = self.Frame.Visible, ZIndex = 12 })
            local backFrame = Draw("Square", { Filled = true, Color = theme.Button, Size = Vector2.new(section.Width - 20, 16), Corner = 4, Visible = self.Frame.Visible, ZIndex = 12 })
            local fillFrame = Draw("Square", { Filled = true, Color = theme.Accent, Size = Vector2.new(0, 16), Corner = 2, Visible = self.Frame.Visible, ZIndex = 13 })
            local valueText = Draw("Text", { Text = tostring(slider.Low) .. " - " .. tostring(slider.High), Size = 13, Color = theme.Text, Center = true, Font = 2, Visible = self.Frame.Visible, ZIndex = 14 })
            
            Insert(self.ContentDrawings, {Obj = label, Type = "Label", Height = 18})
            Insert(self.ContentDrawings, {Obj = backFrame, Type = "SliderFrame", Height = 20})
            Insert(self.ContentDrawings, {Obj = fillFrame, Type = "Ignore"})
            Insert(self.ContentDrawings, {Obj = valueText, Type = "Ignore"})

            function slider:SetValues(low, high)
                self.Low = math.clamp(math.min(low, high), self.Min, self.Max)
                self.High = math.clamp(math.max(low, high), self.Min, self.Max)
                local lowPct = (self.Low - self.Min) / (self.Max - self.Min)
                local highPct = (self.High - self.Min) / (self.Max - self.Min)
                fillFrame.Position = backFrame.Position + Vector2.new(backFrame.Size.X * lowPct, 0)
                fillFrame.Size = Vector2.new(backFrame.Size.X * (highPct - lowPct), backFrame.Size.Y)
                valueText.Text = tostring(math.floor(self.Low)) .. " - " .. tostring(math.floor(self.High))
                self.Callback(self.Low, self.High)
            end

            spawn(function()
                local draggingLow, draggingHigh = false, false
                while true do
                    if section.Frame.Visible and window.CurrentTab == section.Tab and Neverlose.IsOpen then
                        local down = ismouse1pressed()
                        local mPos = getMousePos()
                        if not OpenDropdown and down and isMouseOver(backFrame.Position, backFrame.Size) and not draggingLow and not draggingHigh then
                            local pct = math.clamp((mPos.X - backFrame.Position.X) / backFrame.Size.X, 0, 1)
                            local val = slider.Min + (slider.Max - slider.Min) * pct
                            if math.abs(val - slider.Low) < math.abs(val - slider.High) then draggingLow = true else draggingHigh = true end
                        end
                        if not down then draggingLow, draggingHigh = false, false end
                        if draggingLow then
                            local pct = math.clamp((mPos.X - backFrame.Position.X) / backFrame.Size.X, 0, 1)
                            slider:SetValues(slider.Min + (slider.Max - slider.Min) * pct, slider.High)
                        elseif draggingHigh then
                            local pct = math.clamp((mPos.X - backFrame.Position.X) / backFrame.Size.X, 0, 1)
                            slider:SetValues(slider.Low, slider.Min + (slider.Max - slider.Min) * pct)
                        end
                        
                        local lowPct = (slider.Low - slider.Min) / (slider.Max - slider.Min)
                        local highPct = (slider.High - slider.Min) / (slider.Max - slider.Min)
                        fillFrame.Position = backFrame.Position + Vector2.new(backFrame.Size.X * lowPct, 0)
                        fillFrame.Size = Vector2.new(backFrame.Size.X * (highPct - lowPct), backFrame.Size.Y)
                        fillFrame.Visible = section.Frame.Visible and Neverlose.IsOpen
                        valueText.Position = backFrame.Position + Vector2.new(backFrame.Size.X/2, (backFrame.Size.Y/2))
                        valueText.Visible = section.Frame.Visible and Neverlose.IsOpen
                    else fillFrame.Visible, valueText.Visible = false, false end
                    wait()
                end
            end)
            slider:SetValues(slider.Low, slider.High)
            section.InternalY = section.InternalY + 38; window:RelayoutTab(section.Tab)
            return slider
        end

        function section:AddKeybind(text, defaultKeyName, callback, isMenuKey)
            local kb = {Key = KeyCodeNames[defaultKeyName] or 0x2D, Mode = "Hold", Binding = false, Active = false, MenuOpen = false, Callback = callback}
            local label = Draw("Text", { Text = text, Size = 14, Color = theme.Text, Font = 2, Visible = self.Frame.Visible, ZIndex = 12 })
            local btnFrame = Draw("Square", { Filled = true, Color = theme.Button, Size = Vector2.new(60, 18), Corner = 4, Visible = self.Frame.Visible, ZIndex = 12 })
            local btnText = Draw("Text", { Text = "[" .. GetKeyName(kb.Key) .. "]", Size = 13, Color = theme.Text, Center = true, Font = 2, Visible = self.Frame.Visible, ZIndex = 13 })
            local dropFrame = Draw("Square", { Filled = true, Color = theme.Section, Size = Vector2.new(60, 54), Corner = 4, Visible = false, ZIndex = 20 })
            local optHold = Draw("Text", { Text = "Hold", Size = 12, Color = theme.Accent, Center = true, Font = 2, Visible = false, ZIndex = 21 })
            local optToggle = Draw("Text", { Text = "Toggle", Size = 12, Color = theme.Text, Center = true, Font = 2, Visible = false, ZIndex = 21 })
            local optAlways = Draw("Text", { Text = "Always", Size = 12, Color = theme.Text, Center = true, Font = 2, Visible = false, ZIndex = 21 })
            
            Insert(self.ContentDrawings, {Obj = label, Type = "Label", Height = 22})
            Insert(self.ContentDrawings, {Obj = btnFrame, Type = "KeybindFrame", Height = 0})
            Insert(self.ContentDrawings, {Obj = btnText, Type = "KeybindText", Center = true})
            Insert(self.ContentDrawings, {Obj = dropFrame, Type = "Ignore"})
            Insert(self.ContentDrawings, {Obj = optHold, Type = "Ignore"})
            Insert(self.ContentDrawings, {Obj = optToggle, Type = "Ignore"})
            Insert(self.ContentDrawings, {Obj = optAlways, Type = "Ignore"})

            function kb:SetValue(k) self.Key = k; btnText.Text = "[" .. GetKeyName(self.Key) .. "]" end
            function kb:GetValue() return self.Key end

            local function updateActive()
                if isMenuKey then return end
                local isA = (kb.Mode == "Always") or kb.Active
                ActiveKeybinds[text] = isA and kb.Mode or nil
                kb.Callback(isA)
            end
            spawn(function()
                local wasPressed = {}
                while true do
                    for name, kc in pairs(KeyCodeNames) do
                        local down = iskeypressed(kc)
                        if down and not wasPressed[kc] then
                            if kb.Binding then
                                if kc ~= 0x01 then
                                    kb:SetValue(kc); kb.Binding = false; btnFrame.Color = theme.Button
                                end
                            elseif kc == kb.Key then
                                if isMenuKey then kb.Callback() else
                                    if kb.Mode == "Hold" then kb.Active = true; updateActive() elseif kb.Mode == "Toggle" then kb.Active = not kb.Active; updateActive() end
                                end
                            end
                        elseif not down and wasPressed[kc] then
                            if not isMenuKey and kc == kb.Key and kb.Mode == "Hold" then kb.Active = false; updateActive() end
                        end
                        wasPressed[kc] = down
                    end
                    wait()
                end
            end)
            spawn(function()
                local wasM1, wasM2 = false, false
                while true do
                    if section.Frame.Visible and window.CurrentTab == section.Tab and Neverlose.IsOpen then
                        local m1, m2 = ismouse1pressed(), ismouse2pressed()
                        local overBtn = isMouseOver(btnFrame.Position, btnFrame.Size)
                        if not OpenDropdown and overBtn and m1 and not wasM1 then kb.Binding = true; btnText.Text = "[ ... ]"; btnFrame.Color = theme.Accent end
                        if not OpenDropdown and not isMenuKey and overBtn and m2 and not wasM2 then kb.MenuOpen = not kb.MenuOpen end
                        if kb.MenuOpen then
                            dropFrame.Position = btnFrame.Position + Vector2.new(0, 20); dropFrame.Visible, optHold.Visible, optToggle.Visible, optAlways.Visible = true, true, true, true
                            optHold.Position = dropFrame.Position + Vector2.new(30, 5); optToggle.Position = dropFrame.Position + Vector2.new(30, 21); optAlways.Position = dropFrame.Position + Vector2.new(30, 37)
                            if m1 and not wasM1 then
                                if isMouseOver(optHold.Position - Vector2.new(30,5), Vector2.new(60,16)) then kb.Mode = "Hold"; kb.MenuOpen = false elseif isMouseOver(optToggle.Position - Vector2.new(30,5), Vector2.new(60,16)) then kb.Mode = "Toggle"; kb.MenuOpen = false elseif isMouseOver(optAlways.Position - Vector2.new(30,5), Vector2.new(60,16)) then kb.Mode = "Always"; kb.MenuOpen = false end
                                optHold.Color = kb.Mode == "Hold" and theme.Accent or theme.Text; optToggle.Color = kb.Mode == "Toggle" and theme.Accent or theme.Text; optAlways.Color = kb.Mode == "Always" and theme.Accent or theme.Text; updateActive()
                            end
                        else dropFrame.Visible, optHold.Visible, optToggle.Visible, optAlways.Visible = false, false, false, false end
                        wasM1, wasM2 = m1, m2
                    else
                        kb.MenuOpen = false
                        dropFrame.Visible = false
                        optHold.Visible = false
                        optToggle.Visible = false
                        optAlways.Visible = false
                    end
                    wait()
                end
            end)
            section.InternalY = section.InternalY + 22; window:RelayoutTab(section.Tab)
            return kb
        end

        function section:AddColorPicker(text, default, callback)
            local cp = {Value = default or Color3.new(1,0,0), Callback = callback, H = 0, S = 1, V = 1, Open = false}
            local label = Draw("Text", { Text = text, Size = 14, Color = theme.Text, Font = 2, Visible = self.Frame.Visible, ZIndex = 12 })
            local preview = Draw("Square", { Filled = true, Color = cp.Value, Size = Vector2.new(24, 12), Corner = 3, Visible = self.Frame.Visible, ZIndex = 12 })
            
            local pickerFrame = Draw("Square", { Filled = true, Color = theme.Section, Size = Vector2.new(135, 115), Corner = 6, Visible = false, ZIndex = 60 })
            local pickerOutline = Draw("Square", { Filled = false, Color = theme.Outline, Size = Vector2.new(135, 115), Corner = 6, Visible = false, ZIndex = 61, Thickness = 1 })
            
            local gridParts = {}
            local hueParts = {}
            
            for x = 0, 9 do
                for y = 0, 8 do
                    local p = Draw("Square", { Filled = true, Size = Vector2.new(10, 10), Visible = false, ZIndex = 62 })
                    table.insert(gridParts, {Obj = p, sat = x/9, val = 1-(y/8)})
                    table.insert(section.ContentDrawings, {Obj = p, Type = "PickerPart"})
                end
            end

            for y = 0, 8 do
                local p = Draw("Square", { Filled = true, Size = Vector2.new(12, 10), Visible = false, ZIndex = 62 })
                table.insert(hueParts, {Obj = p, hue = y/8})
                table.insert(section.ContentDrawings, {Obj = p, Type = "PickerPart"})
            end

            table.insert(section.ContentDrawings, {Obj = label, Type = "Label", Height = 22})
            table.insert(section.ContentDrawings, {Obj = preview, Type = "ToggleFrame", Height = 0})
            table.insert(section.ContentDrawings, {Obj = pickerFrame, Type = "PickerPart"})
            table.insert(section.ContentDrawings, {Obj = pickerOutline, Type = "PickerPart"})

            function cp:SetValue(col)
                self.Value = col
                preview.Color = col
                self.Callback(col)
            end
            function cp:GetValue() return self.Value end

            spawn(function()
                local wasM1 = false
                while true do
                    if section.Frame.Visible and window.CurrentTab == section.Tab and Neverlose.IsOpen then
                        local m1, mp = ismouse1pressed(), getMousePos()
                        if not OpenDropdown and isMouseOver(preview.Position, preview.Size) and m1 and not wasM1 then cp.Open = not cp.Open end
                        
                        pickerFrame.Visible = cp.Open
                        pickerOutline.Visible = cp.Open
                        pickerFrame.Position = preview.Position + Vector2.new(30, 0)
                        pickerOutline.Position = pickerFrame.Position
                        
                        for i, p in ipairs(gridParts) do
                            p.Obj.Visible = cp.Open
                            p.Obj.Position = pickerFrame.Position + Vector2.new(10 + (math.floor((i-1)/9) * 10), 10 + (((i-1)%9) * 10))
                            p.Obj.Color = Color3.fromHSV(cp.H, p.sat, p.val)
                            if cp.Open and m1 and isMouseOver(p.Obj.Position, p.Obj.Size) then 
                                cp.S, cp.V = p.sat, p.val 
                                cp:SetValue(Color3.fromHSV(cp.H, cp.S, cp.V))
                            end
                        end

                        for i, p in ipairs(hueParts) do
                            p.Obj.Visible = cp.Open
                            p.Obj.Position = pickerFrame.Position + Vector2.new(112, 10 + ((i-1) * 10))
                            p.Obj.Color = Color3.fromHSV(p.hue, 1, 1)
                            if cp.Open and m1 and isMouseOver(p.Obj.Position, p.Obj.Size) then 
                                cp.H = p.hue 
                                cp:SetValue(Color3.fromHSV(cp.H, cp.S, cp.V))
                            end
                        end
                        wasM1 = m1
                    else
                        cp.Open = false
                        pickerFrame.Visible = false
                        pickerOutline.Visible = false
                        for _, p in ipairs(gridParts) do p.Obj.Visible = false end
                        for _, p in ipairs(hueParts) do p.Obj.Visible = false end
                    end
                    wait()
                end
            end)
            section.InternalY = section.InternalY + 22; window:RelayoutTab(section.Tab)
            return cp
        end

        function section:AddDropdown(text, list, default, callback)
            local dp = {Value = default or list[1], List = list, Callback = callback, Open = false}
            local self_id = {}
            local label = Draw("Text", { Text = text, Size = 14, Color = theme.Text, Font = 2, Visible = self.Frame.Visible, ZIndex = 12 })
            local dropFrame = Draw("Square", { Filled = true, Color = theme.Button, Size = Vector2.new(section.Width - 20, 22), Corner = 4, Visible = self.Frame.Visible, ZIndex = 12 })
            local dropText = Draw("Text", { Text = dp.Value, Size = 14, Color = theme.TextDark, Center = true, Font = 2, Visible = self.Frame.Visible, ZIndex = 13 })
            local container = Draw("Square", { Filled = true, Color = theme.Section, Size = Vector2.new(section.Width - 20, #list * 20 + 10), Corner = 4, Visible = false, ZIndex = 50 })
            local items = {}

            local function clearItems()
                for _, it in ipairs(items) do it.Obj:Remove() end
                items = {}
            end

            local function createItems()
                clearItems()
                for i, val in ipairs(dp.List) do
                    local itemText = Draw("Text", { Text = val, Size = 13, Color = (val == dp.Value and theme.Accent or theme.Text), Center = true, Font = 2, Visible = false, ZIndex = 51 })
                    table.insert(items, {Obj = itemText, Value = val})
                    table.insert(section.ContentDrawings, {Obj = itemText, Type = "DropdownPart"})
                end
                container.Size = Vector2.new(section.Width - 20, #dp.List * 20 + 10)
            end

            function dp:SetValue(val)
                self.Value = val
                dropText.Text = self.Value
                for _, it in ipairs(items) do it.Obj.Color = (it.Value == self.Value and theme.Accent or theme.Text) end
                self.Callback(self.Value)
            end
            function dp:GetValue() return self.Value end
            function dp:Refresh(newList) self.List = newList; createItems() end

            createItems()
            table.insert(section.ContentDrawings, {Obj = label, Type = "Label", Height = 18})
            table.insert(section.ContentDrawings, {Obj = dropFrame, Type = "ButtonFrame", Height = 26})
            table.insert(section.ContentDrawings, {Obj = dropText, Type = "ButtonText", Center = true})
            table.insert(section.ContentDrawings, {Obj = container, Type = "DropdownPart"})

            spawn(function()
                local wasM1 = false
                while true do
                    if section.Frame.Visible and window.CurrentTab == section.Tab and Neverlose.IsOpen then
                        local m1 = ismouse1pressed()
                        local over = isMouseOver(dropFrame.Position, dropFrame.Size)
                        
                        if m1 and not wasM1 then
                            if over then
                                if OpenDropdown == self_id then 
                                    dp.Open = false
                                    OpenDropdown = nil
                                elseif OpenDropdown == nil then
                                    dp.Open = true
                                    OpenDropdown = self_id
                                end
                            elseif dp.Open and not isMouseOver(container.Position, container.Size) then
                                dp.Open = false
                                if OpenDropdown == self_id then OpenDropdown = nil end
                            end
                        end
                        
                        container.Visible = dp.Open
                        container.Position = dropFrame.Position + Vector2.new(0, 25)
                        
                        for i, item in ipairs(items) do
                            item.Obj.Visible = dp.Open
                            item.Obj.Position = container.Position + Vector2.new(container.Size.X/2, 10 + (i-1)*20)
                            if dp.Open and m1 and not wasM1 and isMouseOver(item.Obj.Position - Vector2.new(container.Size.X/2, 8), Vector2.new(container.Size.X, 18)) then
                                dp:SetValue(item.Value)
                                dp.Open = false
                                OpenDropdown = nil
                            end
                        end
                        wasM1 = m1
                    else 
                        dp.Open = false
                        if OpenDropdown == self_id then OpenDropdown = nil end
                        container.Visible = false 
                        for _, it in ipairs(items) do it.Obj.Visible = false end 
                    end
                    wait()
                end
            end)
            section.InternalY = section.InternalY + 44; window:RelayoutTab(section.Tab)
            return dp
        end

        function section:AddMultipleDropdown(text, list, default, callback)
            local mdp = {Value = default or {}, List = list, Callback = callback, Open = false}
            local self_id = {}
            local label = Draw("Text", { Text = text, Size = 14, Color = theme.Text, Font = 2, Visible = self.Frame.Visible, ZIndex = 12 })
            local dropFrame = Draw("Square", { Filled = true, Color = theme.Button, Size = Vector2.new(section.Width - 20, 22), Corner = 4, Visible = self.Frame.Visible, ZIndex = 12 })
            local dropText = Draw("Text", { Text = "...", Size = 14, Color = theme.TextDark, Center = true, Font = 2, Visible = self.Frame.Visible, ZIndex = 13 })
            local container = Draw("Square", { Filled = true, Color = theme.Section, Size = Vector2.new(section.Width - 20, #list * 20 + 10), Corner = 4, Visible = false, ZIndex = 50 })
            local items = {}

            local function updateText()
                local str = ""
                for i, v in ipairs(mdp.Value) do str = str .. v .. (i == #mdp.Value and "" or ", ") end
                if str == "" then str = "None" end
                if #str > 20 then str = str:sub(1, 17) .. "..." end
                dropText.Text = str
            end

            local function createItems()
                for _, it in ipairs(items) do it.Obj:Remove() end
                items = {}
                for i, val in ipairs(mdp.List) do
                    local isS = false
                    for _, s in pairs(mdp.Value) do if s == val then isS = true break end end
                    local itemText = Draw("Text", { Text = val, Size = 13, Color = (isS and theme.Accent or theme.Text), Center = true, Font = 2, Visible = false, ZIndex = 51 })
                    table.insert(items, {Obj = itemText, Value = val})
                    table.insert(section.ContentDrawings, {Obj = itemText, Type = "DropdownPart"})
                end
                container.Size = Vector2.new(section.Width - 20, #mdp.List * 20 + 10)
            end

            function mdp:SetValue(val)
                self.Value = val
                for _, it in ipairs(items) do
                    local s = false
                    for _, v in pairs(self.Value) do if v == it.Value then s = true break end end
                    it.Obj.Color = s and theme.Accent or theme.Text
                end
                updateText()
                self.Callback(self.Value)
            end
            function mdp:GetValue() return self.Value end
            function mdp:Refresh(newList) self.List = newList; createItems() end

            createItems(); updateText()
            table.insert(section.ContentDrawings, {Obj = label, Type = "Label", Height = 18})
            table.insert(section.ContentDrawings, {Obj = dropFrame, Type = "ButtonFrame", Height = 26})
            table.insert(section.ContentDrawings, {Obj = dropText, Type = "ButtonText", Center = true})
            table.insert(section.ContentDrawings, {Obj = container, Type = "DropdownPart"})

            spawn(function()
                local wasM1 = false
                while true do
                    if section.Frame.Visible and window.CurrentTab == section.Tab and Neverlose.IsOpen then
                        local m1 = ismouse1pressed()
                        local over = isMouseOver(dropFrame.Position, dropFrame.Size)
                        
                        if m1 and not wasM1 then
                            if over then
                                if OpenDropdown == self_id then 
                                    mdp.Open = false
                                    OpenDropdown = nil
                                elseif OpenDropdown == nil then
                                    mdp.Open = true
                                    OpenDropdown = self_id
                                end
                            elseif mdp.Open and not isMouseOver(container.Position, container.Size) then
                                mdp.Open = false
                                if OpenDropdown == self_id then OpenDropdown = nil end
                            end
                        end
                        
                        container.Visible = mdp.Open
                        container.Position = dropFrame.Position + Vector2.new(0, 25)
                        
                        for i, item in ipairs(items) do
                            item.Obj.Visible = mdp.Open
                            item.Obj.Position = container.Position + Vector2.new(container.Size.X/2, 10 + (i-1)*20)
                            if mdp.Open and m1 and not wasM1 and isMouseOver(item.Obj.Position - Vector2.new(container.Size.X/2, 8), Vector2.new(container.Size.X, 18)) then
                                local found = false
                                for idx, v in ipairs(mdp.Value) do
                                    if v == item.Value then
                                        table.remove(mdp.Value, idx)
                                        found = true
                                        break
                                    end
                                end
                                if not found then table.insert(mdp.Value, item.Value) end
                                item.Obj.Color = (not found and theme.Accent or theme.Text)
                                updateText()
                                mdp.Callback(mdp.Value)
                            end
                        end
                        wasM1 = m1
                    else 
                        mdp.Open = false
                        if OpenDropdown == self_id then OpenDropdown = nil end
                        container.Visible = false 
                        for _, it in ipairs(items) do it.Obj.Visible = false end 
                    end
                    wait()
                end
            end)
            section.InternalY = section.InternalY + 44; window:RelayoutTab(section.Tab)
            return mdp
        end

        Insert(self.Sections, section) return section
    end

    function window:RelayoutTab(TabName)
        local startX, startY, padding = 170, 30, 15
        local curX, curY, maxH = startX, startY, 0

        for _, s in ipairs(self.Sections) do
            if s.Tab == TabName then
                if curX + s.Width > self.Size.X - 20 then 
                    curX = startX
                    curY = curY + maxH + 30
                    maxH = 0
                end
                
                s.Frame.Position = self.Pos + Vector2.new(curX, curY)
                s.Title.Position = s.Frame.Position + Vector2.new(5, -18)
                
                local lY = 5
                local lastLabelPos = nil
                local lastSquarePos = nil
                local lastSquareSize = nil

                for _, item in ipairs(s.ContentDrawings) do
                    local d = item.Obj
                    if item.Type == "ButtonFrame" or item.Type == "SliderFrame" then
                        d.Position = s.Frame.Position + Vector2.new(10, lY)
                        lastSquarePos = d.Position
                        lastSquareSize = d.Size
                        lY = lY + (item.Height or 26)
                    elseif item.Type == "Label" then
                        d.Position = s.Frame.Position + Vector2.new(10, lY)
                        lastLabelPos = d.Position
                        lY = lY + (item.Height or 18)
                    elseif item.Type == "ToggleFrame" then
                        if lastLabelPos then
                            d.Position = Vector2.new(s.Frame.Position.X + s.Width - d.Size.X - 10, lastLabelPos.Y)
                        end
                    elseif item.Type == "ButtonText" or item.Type == "KeybindText" then
                        if item.Center and lastSquarePos then
                            d.Position = Vector2.new(lastSquarePos.X + (lastSquareSize.X / 2), lastSquarePos.Y + (lastSquareSize.Y / 2))
                        end
                    elseif item.Type == "KeybindFrame" then
                        if lastLabelPos then
                            d.Position = Vector2.new(s.Frame.Position.X + s.Width - d.Size.X - 10, lastLabelPos.Y)
                            lastSquarePos = d.Position
                            lastSquareSize = d.Size
                        end
                    end
                end
                
                s.Frame.Size = Vector2.new(s.Width, lY + 5)
                if s.Frame.Size.Y > maxH then maxH = s.Frame.Size.Y end
                curX = curX + s.Width + padding
            end
        end
    end

    spawn(function()
        local wasD, drag, dsm, dsp, dragK, dsmK, dspK = false, false, nil, nil, false, nil, nil
        while true do
            local d, mp = ismouse1pressed() , getMousePos()
            if Neverlose.IsOpen then
                if d and not wasD and isMouseOver(window.Pos, Vector2.new(window.Size.X, 50)) then drag = true; dsm = mp; dsp = window.Pos end
                if not d then drag = false end
                if drag then window:Move((dsp + (mp - dsm)) - window.Pos) end
                
                if d and not wasD and isMouseOver(KeybindList.MainFrame.Position, Vector2.new(KeybindList.MainFrame.Size.X, 25)) then dragK = true; dsmK = mp; dspK = KeybindList.MainFrame.Position end
                if not d then dragK = false end
                if dragK then 
                    local delta = (dspK + (mp - dsmK)) - KeybindList.MainFrame.Position
                    KeybindList.MainFrame.Position = KeybindList.MainFrame.Position + delta; KeybindList.Title.Position = KeybindList.Title.Position + delta
                end
                
                for _, tab in tabs do
                    if isMouseOver(tab.Position, tab.Size) then
                        if window.CurrentTab ~= tab.Name then tab.Text.Color = Color3.fromRGB(200, 200, 200) end
                        if d and not wasD then 
                            for _, t in ipairs(tabs) do t.Text.Color = theme.TextDark end
                            tab.Text.Color = theme.Text; window.CurrentTab = tab.Name; window.TargetSelectorY = tab.RelativeY; window:UpdateVisibility() 
                        end
                    elseif window.CurrentTab ~= tab.Name then tab.Text.Color = theme.TextDark end
                end
            end
            window.CurrentSelectorY = lerp(window.CurrentSelectorY, window.TargetSelectorY, 0.15); window.GlobalSelector.Position = Vector2.new(window.Pos.X, window.Pos.Y + window.CurrentSelectorY)
            wasD = d; wait(0.01)
        end
    end)

    function window:Finalize()
        self:CreateTabSection("System"); self:CreateTab("Settings")
        local s = self:CreateSection("Menu", "Settings")
        s:AddLabel("v1.0.0"); s:AddKeybind("Menu Keybind", "F1", function() window:SetVisible(not Neverlose.IsOpen) end, true)
        s:AddButton("Unload UI", function() for _, v in ipairs(drawings) do v:Remove() end end)
        self:UpdateVisibility()
    end
    return window
end

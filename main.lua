local TweenService = game:GetService("TweenService")

-- CONFIG
local Theme = {
    Accent = Color3.fromRGB(100, 175, 255),
    Background = Color3.fromRGB(20, 22, 25),
    SecondaryBackground = Color3.fromRGB(30, 33, 36),
    TextColor = Color3.fromRGB(230, 230, 235),
    ElementBackground = Color3.fromRGB(40, 45, 50),
}

local OkraASCII = [[
  /$$$$$$  /$$   /$$ /$$$$$$$   /$$$$$$  
 /$$__  $$| $$  /$$/| $$__  $$ /$$__  $$ 
| $$  \ $$| $$ /$$/ | $$  \ $$| $$  \ $$ 
| $$  | $$| $$$$$/  | $$$$$$$/| $$$$$$$$ 
| $$  | $$| $$  $$  | $$__  $$| $$__  $$ 
| $$  | $$| $$\  $$ | $$  \ $$| $$  | $$ 
|  $$$$$$/| $$ \  $$| $$  | $$| $$  | $$ 
 \______/ |__/  \__/|__/  |__/|__/  |__/ 
]]

-- CREATE SCREEN GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OkraUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- FONT
local defaultFont = Enum.Font.RobotoMono

-- main ui
local function createMainUI()
    local MainGUI = Instance.new("Frame")
    MainGUI.Name = "MainGUI"
    MainGUI.Size = UDim2.new(0, 800, 0, 500)
    MainGUI.Position = UDim2.new(0.5, -400, 0.5, -250)
    MainGUI.BackgroundColor3 = Theme.Background
    MainGUI.BorderSizePixel = 0
    MainGUI.Parent = screenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 16)
    UICorner.Parent = MainGUI

    local CornerDot = Instance.new("Frame")
    CornerDot.Size = UDim2.new(0, 10, 0, 10)
    CornerDot.Position = UDim2.new(0, 5, 0, 5)
    CornerDot.BackgroundColor3 = Theme.Accent
    CornerDot.BorderSizePixel = 0
    CornerDot.Parent = MainGUI

    local CornerDotCorner = Instance.new("UICorner")
    CornerDotCorner.CornerRadius = UDim.new(1, 0)
    CornerDotCorner.Parent = CornerDot

    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Size = UDim2.new(1, 40, 1, 40)
    Shadow.Position = UDim2.new(0, -20, 0, -20)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxassetid://6014261993"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.7
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    Shadow.ZIndex = -1
    Shadow.Parent = MainGUI

    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, 0, 0, 35)
    Header.Position = UDim2.new(0, 0, 1, -35)
    Header.BackgroundColor3 = Theme.SecondaryBackground
    Header.BorderSizePixel = 0
    Header.Parent = MainGUI

    local HeaderText = Instance.new("TextLabel")
    HeaderText.Size = UDim2.new(1, 0, 1, 0)
    HeaderText.BackgroundTransparency = 1
    HeaderText.Font = defaultFont
    HeaderText.TextColor3 = Theme.TextColor
    HeaderText.TextSize = 20
    HeaderText.TextXAlignment = Enum.TextXAlignment.Center
    HeaderText.Text = "Okra"
    HeaderText.Parent = Header

    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 90, 1, -35)
    TabContainer.Position = UDim2.new(0, 0, 0, 0)
    TabContainer.BackgroundColor3 = Theme.SecondaryBackground
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = MainGUI

    local TabList = Instance.new("UIListLayout")
    TabList.Padding = UDim.new(0, 8)
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabList.VerticalAlignment = Enum.VerticalAlignment.Center
    TabList.Parent = TabContainer

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Size = UDim2.new(1, -90, 1, -35)
    ContentFrame.Position = UDim2.new(0, 90, 0, 0)
    ContentFrame.BackgroundColor3 = Theme.Background
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Parent = MainGUI

    local ContentPadding = Instance.new("UIPadding")
    ContentPadding.PaddingTop = UDim.new(0, 10)
    ContentPadding.PaddingLeft = UDim.new(0, 10)
    ContentPadding.PaddingRight = UDim.new(0, 10)
    ContentPadding.Parent = ContentFrame

    local tabs = {}

    local function createTab(tabName, content)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(0, 60, 0, 60)
    TabButton.BackgroundColor3 = Theme.ElementBackground
    TabButton.Font = defaultFont
    TabButton.TextColor3 = Theme.TextColor
    TabButton.TextSize = 16
    TabButton.Text = tabName
    TabButton.TextWrapped = true
    TabButton.TextXAlignment = Enum.TextXAlignment.Center
    TabButton.TextYAlignment = Enum.TextYAlignment.Center
    TabButton.Parent = TabContainer

    local TabButtonCorner = Instance.new("UICorner")
    TabButtonCorner.CornerRadius = UDim.new(0, 8)
    TabButtonCorner.Parent = TabButton

    local TabContent = Instance.new("Frame")
    TabContent.Name = "TabContent"
    TabContent.Size = UDim2.new(1, 0, 1, 0)
    TabContent.Position = UDim2.new(0, 0, 0, 0)
    TabContent.BackgroundColor3 = Theme.Background
    TabContent.Visible = false
    TabContent.Parent = ContentFrame

    if tabName == "About" then
        local contentLabel = Instance.new("TextLabel")
        contentLabel.Size = UDim2.new(1, 0, 1, 0)
        contentLabel.BackgroundTransparency = 1
        contentLabel.Font = defaultFont
        contentLabel.TextColor3 = Theme.TextColor
        contentLabel.TextSize = 16
        contentLabel.Text = content
        contentLabel.TextWrapped = true
        contentLabel.TextXAlignment = Enum.TextXAlignment.Left
        contentLabel.TextYAlignment = Enum.TextYAlignment.Top
        contentLabel.Parent = TabContent
    else
        for i = 1, 3 do
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0, 150, 0, 40)
            Button.Position = UDim2.new(0, 10, 0, (i - 1) * 50)
            Button.BackgroundColor3 = Theme.ElementBackground
            Button.Text = content .. " Button " .. i
            Button.Font = defaultFont
            Button.TextColor3 = Theme.TextColor
            Button.TextSize = 16
            Button.Parent = TabContent

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = Button
        end
    end

    TabButton.MouseButton1Click:Connect(function()
        for _, tab in ipairs(tabs) do
            tab.Content.Visible = false
            tab.Button.BackgroundColor3 = Theme.ElementBackground
        end
        TabContent.Visible = true
        TabButton.BackgroundColor3 = Theme.Accent
    end)

    table.insert(tabs, {Button = TabButton, Content = TabContent})
end

    createTab("Home", "")
    createTab("Settings", "")
    createTab("OKRA", "OKRA UI BY MWISWHKA")

    tabs[1].Button.BackgroundColor3 = Theme.Accent
    tabs[1].Content.Visible = true
end

createMainUI()

-- ASCII & Terminal Animation Code
local Terminal = Instance.new("Frame")
Terminal.Size = UDim2.new(0.6, 0, 0.6, 0)
Terminal.Position = UDim2.new(0.2, 0, 0.2, 0)
Terminal.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Terminal.BorderSizePixel = 0
Terminal.BackgroundTransparency = 1
Terminal.ZIndex = 1000
Terminal.Parent = screenGui
TweenService:Create(Terminal, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()

-- ASCII Label
local ASCIIArt = Instance.new("TextLabel")
ASCIIArt.Size = UDim2.new(1, -20, 0, 140)
ASCIIArt.Position = UDim2.new(0, 425, 0, 10)
ASCIIArt.BackgroundTransparency = 1
ASCIIArt.Font = Enum.Font.Code
ASCIIArt.TextColor3 = Theme.Accent
ASCIIArt.TextSize = 14
ASCIIArt.TextWrapped = true
ASCIIArt.TextXAlignment = Enum.TextXAlignment.Left
ASCIIArt.TextYAlignment = Enum.TextYAlignment.Top
ASCIIArt.Text = ""
ASCIIArt.ZIndex = 1001
ASCIIArt.Parent = Terminal

-- Subtitle
local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -20, 0, 20)
Subtitle.Position = UDim2.new(0, 10, 0, 150)
Subtitle.BackgroundTransparency = 1
Subtitle.Font = Enum.Font.Code
Subtitle.TextColor3 = Theme.Accent
Subtitle.TextSize = 13
Subtitle.TextWrapped = true
Subtitle.Text = ""
Subtitle.ZIndex = 1001
Subtitle.Parent = Terminal

-- LogBox
local LogBox = Instance.new("TextLabel")
LogBox.Size = UDim2.new(1, -20, 1, -180)
LogBox.Position = UDim2.new(0, 10, 0, 180)
LogBox.BackgroundTransparency = 1
LogBox.Font = Enum.Font.Code
LogBox.TextColor3 = Color3.fromRGB(255, 255, 255)
LogBox.TextSize = 13
LogBox.TextXAlignment = Enum.TextXAlignment.Left
LogBox.TextYAlignment = Enum.TextYAlignment.Top
LogBox.TextWrapped = true
LogBox.Text = ""
LogBox.TextTransparency = 1
LogBox.ZIndex = 1001
LogBox.Parent = Terminal

-- Animate Intro
task.spawn(function()
    local lines = {}
    for line in string.gmatch(OkraASCII, "[^\n]+") do
        table.insert(lines, line)
    end

    for _, line in ipairs(lines) do
        ASCIIArt.Text = ASCIIArt.Text .. line .. "\n"
        task.wait(0.1)
    end

    task.wait(1)

    local subtitleText = "by mwiswhka"
    for i = 1, #subtitleText do
        Subtitle.Text = Subtitle.Text .. subtitleText:sub(i, i)
        task.wait(0.05)
    end

    LogBox.TextTransparency = 0
    local steps = {
        "Loading OKRA...",
        "Initializing UI...",
        "Fetching assets...",
        "Finalizing..."
    }
    for _, step in ipairs(steps) do
        LogBox.Text = LogBox.Text .. step .. "\n"
        task.wait(0.7)
    end

    task.wait(1)

    -- Fade out terminal
    local fadeTime = 0.5
    TweenService:Create(Terminal, TweenInfo.new(fadeTime), {BackgroundTransparency = 1}):Play()
    for _, child in ipairs(Terminal:GetChildren()) do
        if child:IsA("TextLabel") then
            TweenService:Create(child, TweenInfo.new(fadeTime), {TextTransparency = 1}):Play()
        end
    end

    task.delay(fadeTime, function()
        Terminal:Destroy()
        local mainUI = CreateMainUI()
        mainUI.Visible = true
        TweenService:Create(mainUI, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
    end)
end)

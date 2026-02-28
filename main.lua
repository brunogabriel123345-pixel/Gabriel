local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService") -- Para animações suaves

-- CONFIGURAÇÕES ORIGINAIS (MANTIDAS)
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg"

-- CORES MODERNAS (ESTILO PREMIUM)
local BACKGROUND_DARK = Color3.fromRGB(15, 15, 15)
local ACCENT_GLOW = Color3.fromRGB(0, 255, 127) -- Neon Green
local PRIMION_GOLD = Color3.fromRGB(255, 180, 0)
local DISCORD_PURPLE = Color3.fromRGB(114, 137, 218)
local ERROR_RED = Color3.fromRGB(255, 50, 50)

-----------------------------------------------------------
-- 1. TELA DE BLOQUEIO (VISUAL UPGRADE)
-----------------------------------------------------------
local screenBlock = Instance.new("ScreenGui")
screenBlock.Name = "PrimionKeySystemV2"
screenBlock.IgnoreGuiInset = true
screenBlock.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 320)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -160)
mainFrame.BackgroundColor3 = BACKGROUND_DARK
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenBlock

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 15)

-- Borda Neon
local stroke = Instance.new("UIStroke")
stroke.Color = ACCENT_GLOW
stroke.Thickness = 2
stroke.Transparency = 0.5
stroke.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Text = "PRIMION KEY SYSTEM"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.BackgroundTransparency = 1
title.Parent = mainFrame

-- Layout principal
local content = Instance.new("Frame")
content.Size = UDim2.new(0.9, 0, 0.7, 0)
content.Position = UDim2.new(0.05, 0, 0.2, 0)
content.BackgroundTransparency = 1
content.Parent = mainFrame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 12)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Parent = content

-- Caixa de Entrada (Estilizada)
local inputKey = Instance.new("TextBox")
inputKey.Size = UDim2.new(1, 0, 0, 45)
inputKey.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
inputKey.PlaceholderText = "Insira sua chave aqui..."
inputKey.Text = ""
inputKey.TextColor3 = Color3.new(1, 1, 1)
inputKey.Font = Enum.Font.Gotham
inputKey.TextSize = 14
inputKey.Parent = content
Instance.new("UICorner", inputKey).CornerRadius = UDim.new(0, 8)

-- Container de Botões
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(1, 0, 0, 45)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = content

local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0.31, 0, 1, 0)
grid.CellPadding = UDim2.new(0.03, 0, 0, 0)
grid.Parent = btnContainer

-- Função para criar botões estilizados
local function StyleButton(btn, color, text)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = (color == PRIMION_GOLD) and Color3.new(0,0,0) or Color3.new(1,1,1)
    btn.BackgroundColor3 = color
    btn.TextSize = 14
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    
    -- Efeito de clique
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(0.95, 0, 0.95, 0)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    end)
end

local btnGet = Instance.new("TextButton", btnContainer)
StyleButton(btnGet, Color3.fromRGB(46, 204, 113), "GET KEY")

local btnCheck = Instance.new("TextButton", btnContainer)
StyleButton(btnCheck, ACCENT_GLOW, "CHECK")

local btnPrimion = Instance.new("TextButton", btnContainer)
StyleButton(btnPrimion, PRIMION_GOLD, "PREMIUM")

local btnDiscord = Instance.new("TextButton")
btnDiscord.Size = UDim2.new(1, 0, 0, 40)
btnDiscord.BackgroundColor3 = DISCORD_PURPLE
StyleButton(btnDiscord, DISCORD_PURPLE, "JOIN DISCORD SUPPORT")
btnDiscord.Parent = content

local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(1, 0, 0, 20)
feedback.BackgroundTransparency = 1
feedback.Text = ""
feedback.Font = Enum.Font.GothamMedium
feedback.TextSize = 14
feedback.Parent = content

-----------------------------------------------------------
-- 2. PAINEL DE FUNÇÕES (ABRE APÓS A KEY)
-----------------------------------------------------------
local function AbrirPainelPrincipal()
    screenBlock:Destroy() 

    local mainGui = Instance.new("ScreenGui")
    mainGui.Name = "PrimionHub"
    mainGui.Parent = playerGui

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 120, 0, 40)
    toggleBtn.Position = UDim2.new(0, 10, 0.5, 0)
    toggleBtn.BackgroundColor3 = COR_PAINEL or BACKGROUND_DARK
    toggleBtn.Text = "ABRIR PAINEL"
    toggleBtn.TextColor3 = Color3.new(1,1,1)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.Parent = mainGui
    Instance.new("UICorner", toggleBtn)

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 350)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
    mainFrame.BackgroundColor3 = BACKGROUND_DARK
    mainFrame.Visible = false
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = mainGui
    Instance.new("UICorner", mainFrame)
    Instance.new("UIStroke", mainFrame).Color = PRIMION_GOLD

    local titleHub = Instance.new("TextLabel")
    titleHub.Size = UDim2.new(1, 0, 0, 50)
    titleHub.Text = "PRIMION EXECUTOR"
    titleHub.TextColor3 = PRIMION_GOLD
    titleHub.Font = Enum.Font.GothamBold
    titleHub.TextSize = 18
    titleHub.BackgroundTransparency = 1
    titleHub.Parent = mainFrame

    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 8)
    list.HorizontalAlignment = Enum.HorizontalAlignment.Center
    list.Parent = mainFrame

    local function CreateCheatBtn(name, color)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.9, 0, 0, 40)
        btn.BackgroundColor3 = color
        btn.Text = name
        btn.Font = Enum.Font.GothamBold
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Parent = mainFrame
        Instance.new("UICorner", btn)
        return btn
    end

    local flyBtn = CreateCheatBtn("FLY (VOAR)", Color3.fromRGB(52, 152, 219))
    local fpsBtn = CreateCheatBtn("FPS KILLER", Color3.fromRGB(231, 76, 60))
    local noclipBtn = CreateCheatBtn("NOCLIP", Color3.fromRGB(155, 89, 182))
    local crasherBtn = CreateCheatBtn("SERVER CRASHER", Color3.fromRGB(0, 0, 0))

    toggleBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
    end)
end

-----------------------------------------------------------
-- LÓGICA DO KEY SYSTEM (MANTIDA)
-----------------------------------------------------------
btnGet.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_GET_KEY) end
    feedback.TextColor3 = Color3.new(1,1,1)
    feedback.Text = "Link copiado! Verifique seu navegador."
end)

btnCheck.MouseButton1Click:Connect(function()
    if inputKey.Text == KEY_CORRETA then
        feedback.TextColor3 = ACCENT_GLOW
        feedback.Text = "Acesso autorizado! Carregando..."
        task.wait(1)
        AbrirPainelPrincipal()
    else
        feedback.TextColor3 = ERROR_RED
        feedback.Text = "Chave inválida! Tente novamente."
        -- Efeito de tremer na caixa de texto
        local posOriginal = inputKey.Position
        for i = 1, 5 do
            inputKey.Position = posOriginal + UDim2.new(0, math.random(-5,5), 0, 0)
            task.wait(0.05)
        end
        inputKey.Position = posOriginal
    end
end)

btnPrimion.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_GAMEPASS) end
    feedback.TextColor3 = PRIMION_GOLD
    feedback.Text = "Link do Gamepass Lifetime copiado!"
end)

btnDiscord.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_DISCORD) end
    feedback.TextColor3 = DISCORD_PURPLE
    feedback.Text = "Link do Discord copiado!"
end)

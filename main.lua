local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- CONFIGURAÇÕES
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg"

-- Cores
local COR_VERDE_CLARO = Color3.fromRGB(46, 204, 113)
local COR_VERDE_ESCURO = Color3.fromRGB(39, 174, 96)
local COR_DOURADO = Color3.fromRGB(255, 215, 0)
local COR_DISCORD = Color3.fromRGB(88, 101, 242)
local COR_ERRO = Color3.fromRGB(255, 0, 0)
local COR_PAINEL = Color3.fromRGB(20, 20, 20)

-----------------------------------------------------------
-- 1. TELA DE BLOQUEIO (KEY SYSTEM)
-----------------------------------------------------------
local screenBlock = Instance.new("ScreenGui")
screenBlock.Name = "TelaBloqueioPro"
screenBlock.IgnoreGuiInset = true
screenBlock.Parent = playerGui

local frameBlock = Instance.new("Frame")
frameBlock.Size = UDim2.new(1, 0, 1, 0)
frameBlock.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
frameBlock.Active = true
frameBlock.Parent = screenBlock

local layoutBlock = Instance.new("UIListLayout")
layoutBlock.Padding = UDim.new(0, 15)
layoutBlock.HorizontalAlignment = Enum.HorizontalAlignment.Center
layoutBlock.VerticalAlignment = Enum.VerticalAlignment.Center
layoutBlock.Parent = frameBlock

local btnDiscord = Instance.new("TextButton")
btnDiscord.Size = UDim2.new(0.3, 0, 0.06, 0)
btnDiscord.BackgroundColor3 = COR_DISCORD
btnDiscord.Text = "🎧 ATENDIMENTO / SUPORTE"
btnDiscord.TextColor3 = Color3.fromRGB(255, 255, 255)
btnDiscord.Font = Enum.Font.GothamBold
btnDiscord.TextSize = 16
btnDiscord.Parent = frameBlock
Instance.new("UICorner", btnDiscord)

local container = Instance.new("Frame")
container.Size = UDim2.new(0.6, 0, 0.07, 0)
container.BackgroundTransparency = 1
container.Parent = frameBlock

local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0.31, 0, 1, 0)
grid.CellPadding = UDim2.new(0.02, 0, 0, 0)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.Parent = container

local btnGet = Instance.new("TextButton")
btnGet.Text = "GET KEY"
btnGet.Font = Enum.Font.GothamBold
btnGet.BackgroundColor3 = COR_VERDE_CLARO
btnGet.Parent = container
Instance.new("UICorner", btnGet)

local btnCheck = Instance.new("TextButton")
btnCheck.Text = "CHECK KEY"
btnCheck.Font = Enum.Font.GothamBold
btnCheck.BackgroundColor3 = COR_VERDE_ESCURO
btnCheck.Parent = container
Instance.new("UICorner", btnCheck)

local btnPrimion = Instance.new("TextButton")
btnPrimion.Text = "KEY PRIMION"
btnPrimion.BackgroundColor3 = COR_DOURADO
btnPrimion.TextColor3 = Color3.fromRGB(0, 0, 0)
btnPrimion.Font = Enum.Font.GothamBold
btnPrimion.Parent = container
Instance.new("UICorner", btnPrimion)

local inputKey = Instance.new("TextBox")
inputKey.Size = UDim2.new(0.4, 0, 0.06, 0)
inputKey.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
inputKey.PlaceholderText = "Cole a sua chave aqui..."
inputKey.Text = ""
inputKey.TextColor3 = Color3.fromRGB(255, 255, 255)
inputKey.Font = Enum.Font.Gotham
inputKey.Parent = frameBlock
Instance.new("UICorner", inputKey)

local txtInfo = Instance.new("TextLabel")
txtInfo.Size = UDim2.new(0.8, 0, 0.05, 0)
txtInfo.BackgroundTransparency = 1
txtInfo.Text = "Obtenha a Key Grátis em 'Get Key' ou adquira a Key Primion Lifetime (não expira)."
txtInfo.TextColor3 = Color3.fromRGB(200, 200, 200)
txtInfo.Font = Enum.Font.GothamMedium
txtInfo.TextSize = 14
txtInfo.Parent = frameBlock

local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(0.8, 0, 0.05, 0)
feedback.BackgroundTransparency = 1
feedback.Text = ""
feedback.Font = Enum.Font.GothamBold
feedback.Parent = frameBlock

-----------------------------------------------------------
-- 2. PAINEL DE FUNÇÕES (ABRE APÓS A KEY)
-----------------------------------------------------------
local function AbrirPainelPrincipal()
    screenBlock:Destroy() -- Deleta a tela de bloqueio

    local mainGui = Instance.new("ScreenGui")
    mainGui.Name = "PrimionHub"
    mainGui.Parent = playerGui

    -- Botão de Toggle (Abrir/Fechar)
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 100, 0, 40)
    toggleBtn.Position = UDim2.new(0, 10, 0.5, 0)
    toggleBtn.BackgroundColor3 = COR_PAINEL
    toggleBtn.Text = "ABRIR/FECHAR"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 12
    toggleBtn.Parent = mainGui
    Instance.new("UICorner", toggleBtn)

    -- Frame do Painel
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 300, 0, 350)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
    mainFrame.BackgroundColor3 = COR_PAINEL
    mainFrame.Visible = false -- Começa fechado
    mainFrame.Active = true
    mainFrame.Draggable = true -- Permite arrastar o painel
    mainFrame.Parent = mainGui
    Instance.new("UICorner", mainFrame)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Text = "PRIMION EXECUTOR"
    title.TextColor3 = COR_DOURADO
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.BackgroundTransparency = 1
    title.Parent = mainFrame

    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 10)
    list.HorizontalAlignment = Enum.HorizontalAlignment.Center
    list.Parent = mainFrame

    -- Função para criar botões de cheat
    local function CreateCheatBtn(name, color)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.9, 0, 0, 45)
        btn.BackgroundColor3 = color
        btn.Text = name
        btn.Font = Enum.Font.GothamBold
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Parent = mainFrame
        Instance.new("UICorner", btn)
        return btn
    end

    local flyBtn = CreateCheatBtn("FLY (VOAR)", Color3.fromRGB(52, 152, 219))
    local fpsBtn = CreateCheatBtn("FPS KILLER", Color3.fromRGB(231, 76, 60))
    local noclipBtn = CreateCheatBtn("NOCLIP (ATRAVESSAR)", Color3.fromRGB(155, 89, 182))
    local crasherBtn = CreateCheatBtn("SERVER CRASHER", Color3.fromRGB(0, 0, 0))

    -- Toggle Lógica
    toggleBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
    end)

    -- Ações dos Botões (Exemplo de print, você deve colocar seus scripts aqui)
    flyBtn.MouseButton1Click:Connect(function() print("Fly Ativado") end)
    fpsBtn.MouseButton1Click:Connect(function() print("FPS Killer Ativado") end)
    noclipBtn.MouseButton1Click:Connect(function() print("Noclip Ativado") end)
    crasherBtn.MouseButton1Click:Connect(function() print("Crasher Ativado") end)
end

-----------------------------------------------------------
-- LÓGICA DO KEY SYSTEM
-----------------------------------------------------------
btnGet.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_GET_KEY) end
    feedback.TextColor3 = COR_VERDE_CLARO
    feedback.Text = "Link da chave copiado com sucesso!"
end)

btnCheck.MouseButton1Click:Connect(function()
    if inputKey.Text == KEY_CORRETA then
        feedback.TextColor3 = COR_VERDE_ESCURO
        feedback.Text = "Acesso autorizado! Abrindo painel..."
        task.wait(1)
        AbrirPainelPrincipal()
    else
        feedback.TextColor3 = COR_ERRO
        feedback.Text = "Chave incorreta! Verifique e tente novamente."
    end
end)

btnPrimion.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_GAMEPASS) end
    feedback.TextColor3 = COR_DOURADO
    feedback.Text = "Cole o link no seu navegador e pague 100 Robux para desbloquear."
end)

btnDiscord.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK_DISCORD) end
    feedback.TextColor3 = COR_DISCORD
    feedback.Text = "Link do suporte copiado!"
end)

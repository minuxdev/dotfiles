-- ============================================================================
-- Definições para o ALT-Tab (Submaps - Sintaxe Oficial Corrigida)
-- ============================================================================

-- Ativa o submap 'alttab' ao pressionar ALT+TAB
hl.bind("ALT + Tab", hl.dsp.submap("alttab"))
hl.bind("ALT + SHIFT + Tab", hl.dsp.submap("alttab"))

-- Declaração do conteúdo do submap 'alttab'
hl.define_submap("alttab", function()
  -- Sair do submap e voltar ao modo normal (reset) ao soltar o ALT ou ESC
  hl.bind("ALT_L", hl.dsp.submap("reset"))
  hl.bind("Escape", hl.dsp.submap("reset"))

  -- Comandos do hyprfloat ativos apenas enquanto estiver no modo alttab
  hl.bind("ALT + Tab", hl.dsp.exec_cmd("hyprfloat alttab next"))
  hl.bind("ALT + SHIFT + Tab", hl.dsp.exec_cmd("hyprfloat alttab prev"))
  hl.bind("ALT + grave", hl.dsp.exec_cmd("hyprfloat alttab next sameclass"))
  hl.bind("ALT + SHIFT + grave", hl.dsp.exec_cmd("hyprfloat alttab prev sameclass"))
end)


-- ============================================================================
-- Regras de Janelas (Sintaxe de Tabela Direta Explicita)
-- ============================================================================

hl.window_rule { match = { title = "^(hyprfloat:.*)$" }, float = true, no_anim = true }
hl.window_rule { match = { title = "^(hyprfloat:alttab)$" }, pin = true, size = "0 0", stay_focused = true }
hl.window_rule { match = { title = "^(hyprfloat:dummy)$" }, border_size = 0, size = "0 0" }

-- Estilos de janela para os modos Flutuante (Floating) e Mosaico (Tiling)
hl.window_rule { match = { float = true }, border_color = "rgba(00ff99ee) rgba(33ccffee) 45deg", border_size = 2 }
hl.window_rule { match = { float = false }, border_color = "rgba(33ccffee) rgba(00ff99ee) 45deg", border_size = 1 }

-- Estilos de janela para o modo de Visão Geral (Overview)
hl.window_rule { match = { tag = "overview" }, border_color = "rgba(ffd700ee) rgba(ff8c00ee) 45deg", border_size = 1 }

-- ============================================================================
-- Atalhos de Teclado Sugeridos (Sintaxe Lua Oficial Corrigida)
-- ============================================================================

hl.bind("SUPER + backslash", hl.dsp.exec_cmd("hyprfloat overview"))
hl.bind("SUPER + SHIFT + backslash", hl.dsp.exec_cmd("hyprfloat togglefloat"))
hl.bind("SUPER + Up", hl.dsp.exec_cmd("hyprfloat dynamicbind SUPER_UP"))
hl.bind("SUPER + Down", hl.dsp.exec_cmd("hyprfloat dynamicbind SUPER_DOWN"))
hl.bind("SUPER + Left", hl.dsp.exec_cmd("hyprfloat dynamicbind SUPER_LEFT"))
hl.bind("SUPER + Right", hl.dsp.exec_cmd("hyprfloat dynamicbind SUPER_RIGHT"))

hl.bind("SUPER + Insert", hl.dsp.exec_cmd("hyprfloat snap 0.0 0.0 0.0 0.5"))
hl.bind("SUPER + Home", hl.dsp.exec_cmd("hyprfloat snap 0.0 1.0 0.0 0.5"))
hl.bind("SUPER + Prior", hl.dsp.exec_cmd("hyprfloat snap 0.7 1.0 0.0 0.5")) -- Prior = Page_Up
hl.bind("SUPER + Delete", hl.dsp.exec_cmd("hyprfloat snap 0.0 0.3 0.5 1.0"))
hl.bind("SUPER + End", hl.dsp.exec_cmd("hyprfloat snap 0.0 1.0 0.5 1.0"))
hl.bind("SUPER + Next", hl.dsp.exec_cmd("hyprfloat snap 0.7 1.0 0.5 1.0")) -- Next = Page_Down

hl.bind("SUPER + SHIFT + Insert", hl.dsp.exec_cmd("hyprfloat snap 0.0 0.7 0.0 1.0"))
hl.bind("SUPER + SHIFT + Home", hl.dsp.exec_cmd("hyprfloat snap 0.2 0.8 0.0 1.0"))
hl.bind("SUPER + SHIFT + Prior", hl.dsp.exec_cmd("hyprfloat snap 0.7 1.0 0.0 1.0"))
hl.bind("SUPER + SHIFT + Up", hl.dsp.exec_cmd("hyprfloat snap 0.0 1.0 0.0 1.0"))
hl.bind("SUPER + SHIFT + Left", hl.dsp.exec_cmd("hyprfloat movemon -1"))
hl.bind("SUPER + SHIFT + Right", hl.dsp.exec_cmd("hyprfloat movemon +1"))
hl.bind("SUPER + SHIFT + Down", hl.dsp.exec_cmd("hyprfloat center 1.00"))

hl.bind("SUPER + CTRL + Left", hl.dsp.exec_cmd("hyprfloat workspacegroup prev"))
hl.bind("SUPER + CTRL + Right", hl.dsp.exec_cmd("hyprfloat workspacegroup next"))
hl.bind("SUPER + CTRL + Insert", hl.dsp.exec_cmd("hyprfloat workspacegroup group 1"))
hl.bind("SUPER + CTRL + Home", hl.dsp.exec_cmd("hyprfloat workspacegroup group 2"))
hl.bind("SUPER + CTRL + Prior", hl.dsp.exec_cmd("hyprfloat workspacegroup group 3"))
hl.bind("SUPER + CTRL + m", hl.dsp.exec_cmd("hyprfloat workspacegroup move"))

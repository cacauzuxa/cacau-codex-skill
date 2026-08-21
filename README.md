# Cacau para Codex

Cacau orquestra Sol e Luna para economizar contexto sem abrir mão de uma revisão proporcional ao risco.

## Instalação pelo próprio Codex

Cole no chat do Codex:

```text
$skill-installer Instale a Cacau deste repositório: https://github.com/luckwolff-web/cacau-codex-skill/tree/main/cacau
```

O instalador baixa a pasta `cacau` e valida o `SKILL.md`.

Depois, em uma nova tarefa, invoque:

```text
$cacau seu pedido aqui
```

## Estrutura

- `cacau/SKILL.md`: fluxo de orquestração e limites.
- `cacau/agents/openai.yaml`: nome, descrição e política de invocação.

## Segurança

A skill não contém credenciais. Pagamentos, publicações, exclusões e outros efeitos externos continuam exigindo autorização explícita.

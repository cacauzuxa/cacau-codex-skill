# Cacau para Codex

Cacau orquestra Sol e Luna para economizar contexto sem abrir mão de uma revisão proporcional ao risco.

## Instalação pelo próprio Codex

No Codex, invoque `$skill-installer` e peça para instalar a pasta `cacau` deste repositório.

Depois, em uma nova tarefa, invoque:

```text
$cacau seu pedido aqui
```

## Estrutura

- `cacau/SKILL.md`: fluxo de orquestração e limites.
- `cacau/agents/openai.yaml`: nome, descrição e política de invocação.

## Segurança

A skill não contém credenciais. Pagamentos, publicações, exclusões e outros efeitos externos continuam exigindo autorização explícita.


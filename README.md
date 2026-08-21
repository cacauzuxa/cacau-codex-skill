# Cacau para Codex

Cacau organiza o trabalho entre Sol e Luna: o modelo principal planeja e revisa, enquanto uma Luna High executa leitura, implementação e testes em uma tarefa lateral.

## Guia visual

[Abra o infográfico completo](docs/cacau-infografico.pdf) para ver o fluxo, exemplos de uso e onde existe potencial de economia de contexto.

## Instalação

Cole no chat do Codex:

```text
$skill-installer Instale a Cacau deste repositório: https://github.com/cacauzuxa/cacau-codex-skill/tree/main/cacau
```

O instalador baixa a pasta `cacau` e valida o `SKILL.md`.

## Uso

Em uma nova tarefa, invoque a skill junto do pedido:

```text
$cacau Implemente o filtro, mantenha o formato atual e rode os testes.
```

A Cacau tende a ajudar mais quando há bastante contexto para ler, um escopo verificável e um retorno curto para o Sol revisar. Para ajustes triviais, usar apenas o chat principal pode ser mais econômico.

## Pet opcional

O pet animado da Cacau pode ser instalado separadamente:

```text
npx codex-pets add cacau
```

[Veja a Cacau no Codex Pets](https://codex-pets.net/#/pets/cacau).

## Estrutura

- `cacau/SKILL.md`: fluxo de orquestração e limites.
- `cacau/agents/openai.yaml`: nome, descrição e política de invocação.
- `docs/cacau-infografico.pdf`: guia visual em duas páginas.

## Segurança

A skill não contém credenciais. Pagamentos, publicações, exclusões e outros efeitos externos continuam exigindo autorização explícita.

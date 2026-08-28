# Cacau para Codex

Uma skill explícita para organizar trabalho entre o modelo principal do Codex (Sol) e uma Luna High. Sol mantém o contexto da conversa, enquanto a tarefa lateral faz a análise ou a implementação autorizada e devolve evidências para revisão.

> A Cacau não troca o modelo principal, não promete economia e não executa efeitos externos sem autorização.

## O que ela faz

- Separa leitura, revisão e diagnóstico sem alteração do modo de mudança.
- Em uma implementação autorizada, reserva a escrita para a Luna e preserva o escopo indicado.
- Para em caso de timeout, falha, evidência insuficiente ou mudança não mecânica que precise de decisão.
- Devolve um resultado curto com arquivos, testes, riscos e pendências para Sol revisar.

## Instalação

No chat do Codex, use o instalador de skills com o repositório e a pasta da skill:

```text
$skill-installer Instale a skill Cacau deste repositório: https://github.com/cacauzuxa/cacau-codex-skill/tree/main/cacau
```

Depois da instalação, invoque a skill somente quando quiser esse fluxo. A Cacau exige a invocação explícita de `$cacau`.

## Como usar

Inclua `$cacau` no pedido e diga o resultado esperado:

```text
$cacau Implemente o filtro por status, preserve o formato atual e rode os testes afetados.
```

Para uma análise sem mudanças, deixe a restrição clara:

```text
$cacau Diagnostique por que a importação falha e revise os arquivos sem alterar nada.
```

Para uma tarefa de manutenção, delimite também os arquivos, os invariantes e a validação:

```text
$cacau Atualize a documentação em README.md e docs/index.html. Não altere cacau/SKILL.md.
Valide os links locais e informe qualquer pendência de publicação.
```

## Funcionamento: Sol e Luna

1. **Sol classifica o pedido.** Leitura, revisão e diagnóstico seguem em modo somente leitura. Implementação e correção só seguem quando o pedido autoriza a mudança.
2. **Luna executa a tarefa lateral.** Em modo de mudança, ela é a única escritora temporária dentro do escopo declarado. Em modo somente leitura, não edita, exclui, move nem produz efeitos externos.
3. **Sol revisa as evidências.** O resultado considera o diff, os testes diretamente afetados e, quando necessário, a validação do risco concreto. Código gerado ou exit code zero, isoladamente, não prova que o objetivo foi atendido.

Esse fluxo ajuda a manter análise e implementação separadas, mas o resultado ainda depende do escopo, dos testes e do ambiente disponíveis.

## Limitações e segurança

- A skill só pode ser usada com `$cacau`; ela não é acionada implicitamente.
- A disponibilidade da Luna, o modelo e o tempo de execução dependem do ambiente do Codex.
- A Cacau não garante que uma tarefa ficará mais rápida, barata ou correta sem uma validação adequada.
- Pagamentos, uploads, envios, publicações, exclusões, movimentação de arquivos e outras ações externas continuam exigindo autorização explícita.
- Em caso de falha ou timeout, a tarefa deve parar e reportar a pendência; não há promessa de estado completo.
- Não coloque credenciais, tokens ou dados sensíveis no pedido, no repositório ou nos artefatos de teste.

## Estrutura

- [`cacau/SKILL.md`](cacau/SKILL.md): regras de roteamento, propriedade de escrita e revisão.
- [`cacau/agents/openai.yaml`](cacau/agents/openai.yaml): nome, descrição e política de invocação.
- [`docs/index.html`](docs/index.html): landing page estática para GitHub Pages.
- [`docs/cacau-infografico.pdf`](docs/cacau-infografico.pdf): guia visual do fluxo.

## Links

- [Abrir o repositório no GitHub](https://github.com/cacauzuxa/cacau-codex-skill)
- [Abrir a landing page](https://cacauzuxa.github.io/cacau-codex-skill/)
- [Conhecer a Cacau no Codex Pets](https://codex-pets.net/#/pets/cacau)

## Licença

Este projeto está disponível sob a [licença MIT](LICENSE). Copyright © 2026 Lucas Forte.

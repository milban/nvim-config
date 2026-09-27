# CodeCompanion 사용법

직접 코딩하고 문서를 작성하면서, 필요한 부분만 AI에 질문하는 구성입니다.
CodeCompanion의 대화 버퍼에 Codex를 ACP로 연결합니다.

## 시작하기

Neovim을 다시 실행한 뒤 `Space aa`로 대화 창을 엽니다.
질문을 작성하고 `Esc`를 눌러 Normal 모드로 나온 뒤 `Enter`로 전송합니다.
`Space aa`로 창을 숨겨도 현재 Neovim 세션의 대화는 유지됩니다.
새 대화는 `:CodeCompanionChat`으로 시작합니다.

| 키 | 용도와 이유 |
| --- | --- |
| `Space aa` | 작업 중 대화를 빠르게 열고 숨깁니다. |
| Visual 모드에서 `Space av` | 선택한 코드나 문단을 기존 대화에 첨부합니다. 질문은 별도로 작성합니다. |
| `Space ap` | 기능을 외우지 않고 AI 작업 메뉴에서 찾습니다. |

예를 들어 함수를 `V`로 선택하고 `Space av`를 누른 뒤 다음과 같이 질문합니다.

```text
이 함수의 실행 흐름과 놓친 경계 조건을 설명해주세요.
코드는 수정하지 마세요.
```

현재 버퍼는 `#{buffer}`, LSP 진단은 `#{diagnostics}`, Git 변경 사항은
`#{diff}`를 질문에 넣어 전달할 수 있습니다.

## Markdown 표시

`render-markdown.nvim`으로 일반 Markdown 문서와 CodeCompanion 대화의 제목,
코드 블록, 목록, 표를 보기 좋게 표시합니다. 파일 내용 자체는 변경하지 않습니다.

- `:RenderMarkdown toggle`: Markdown 표시 기능을 켜거나 끕니다.
- `:RenderMarkdown buf_toggle`: 현재 버퍼에서만 표시 기능을 켜거나 끕니다.

일반 Markdown 문서는 입력 모드에서 원문을 편집하고 Normal 모드에서 렌더링된
내용을 읽을 수 있습니다. 커서가 있는 부분은 편집하기 쉽도록 원문이 드러날 수 있습니다.

## 연결과 권한

- ChatGPT 인증을 사용합니다. 필요한 경우 터미널에서 `codex login`을 실행합니다.
- 새 대화는 `Ask for approval` 모드로 시작합니다. ACP 내부 ID는 `read-only`이지만,
  현재 연결 프로그램에서는 작업 폴더 쓰기가 가능한 모드이므로 엄격한 읽기 전용은 아닙니다.
- 한국어 존댓말로 설명·검토하고 명시적 요청 전에는 수정하지 않도록 기본 지침을 설정했습니다.
  이 지침은 파일 쓰기를 기술적으로 차단하는 권한 설정과는 다릅니다.
- 이 설정은 Chat을 위한 것입니다. Inline 등 다른 기능에는 별도 어댑터 설정이 필요할 수 있습니다.
- 대화 중 결정한 내용은 프로젝트의 Markdown 문서에 직접 정리합니다.

## 재설치와 확인

CodeCompanion은 `vim.pack`으로 v19.26.0을 설치합니다. Codex 연결 프로그램은 다음과 같이 설치합니다.

```sh
bun add --global @agentclientprotocol/codex-acp@1.13.1
```

연결에 문제가 있으면 `:checkhealth codecompanion`과 `:messages`를 확인합니다.
터미널에서 `codex-acp --version`과 `codex login status`로 설치 및 인증을 확인할 수 있습니다.

- [CodeCompanion 공식 문서](https://codecompanion.olimorris.dev/getting-started)
- [Codex ACP 연결 프로그램](https://github.com/agentclientprotocol/codex-acp)

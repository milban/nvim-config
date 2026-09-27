# Git 사용법

gitsigns는 편집 중인 파일의 변경 내용을 표시하고, LazyGit은 저장소의 커밋과 브랜치를 관리합니다.
아래 `Space`는 스페이스 키입니다. Neovim 단축키는 `Esc`로 Normal mode에 들어간 뒤 순서대로 누르시면 됩니다.
이 문서는 `Space gh` 또는 `:GitHelp`로 여실 수 있습니다. 문서 창은 `Ctrl-w q`로 닫으시면 됩니다.

## gitsigns: 변경 확인과 stage

Git 저장소 안의 파일을 열면 줄 번호 옆에 추가·수정·삭제 표시가 나타납니다.
현재 줄의 작성자·커밋 정보(blame)는 기본으로 켜져 있으며, 커서를 잠시 멈추면 줄 끝에 표시됩니다.
서로 붙어 있는 변경 줄의 묶음을 hunk라고 합니다. stage는 다음 커밋에 포함할 변경을 고르는 작업입니다.
gitsigns 단축키는 gitsigns가 연결된 파일 버퍼에서 동작합니다.

| 단축키 | 동작 |
|---|---|
| `]c` / `[c` | 다음 / 이전 변경으로 이동 |
| `Space hp` | 커서가 있는 변경 묶음 미리보기 |
| `Space hs` | 현재 변경 묶음 stage / 이미 stage한 변경 unstage |
| Visual mode에서 `Space hs` | 선택한 줄의 변경만 stage / unstage |
| `Space hS` | 현재 파일 전체 stage (`S`는 대문자) |
| `Space hr` | 현재 변경을 index의 내용으로 되돌리기 |
| `Space hb` | 현재 줄을 마지막으로 수정한 커밋 정보 |
| `Space tb` | 줄 끝에 작성자·커밋 정보를 표시하거나 숨기기 |
| `Space hd` | 현재 파일을 index(stage된 내용)와 나란히 비교 |
| `vih` | 현재 변경 묶음을 Visual mode로 선택 |

`Space hr`는 stage 취소가 아니라 편집 내용을 되돌리는 동작입니다. 잘못 실행하셨다면 바로 `u`로 복구하실 수 있습니다.
diff 창을 닫으실 때는 비교 창으로 이동하여 `:q`를 실행하시고, diff 표시가 남아 있으면 `:diffoff`를 실행하시면 됩니다.

## LazyGit: 커밋과 브랜치 관리

| Neovim 단축키 / 명령 | 동작 |
|---|---|
| `Space gg` | 현재 파일이 속한 저장소에서 LazyGit 열기 |
| `Space gG` / `:LazyGit` | 현재 작업 디렉터리에서 LazyGit 열기 |
| `:LazyGitFilterCurrentFile` | 현재 파일의 커밋 이력 보기 |

LazyGit은 디스크에 저장된 파일을 읽으므로 먼저 `:w`로 저장해 주세요. 여러 파일을 수정하셨다면 `:wa`로 모두 저장하실 수 있습니다.
파일을 열지 않은 상태에서는 저장소 디렉터리에서 Neovim을 실행하고 `Space gG`를 사용하시면 됩니다.

LazyGit 화면에서는 아래 키를 사용합니다. 화면과 선택 항목에 따라 동작이 달라지므로 `?`로 해당 화면의 도움말을 확인하실 수 있습니다.

| LazyGit 키 | 동작 |
|---|---|
| `Tab` / `Shift-Tab` | 패널 이동 |
| `j` / `k` | 목록에서 아래 / 위로 이동 |
| Files 패널에서 `Space` | 선택한 파일 stage / unstage |
| Files 패널에서 `Enter` | 변경 내용을 열어 줄 단위로 확인 |
| Files 패널에서 `c` | stage한 변경을 커밋할 메시지 입력 |
| 커밋 메시지 입력 후 `Enter` | 커밋 실행 |
| `P` | push (대문자) |
| `p` | pull (소문자) |
| Local branches 목록에서 `Space` | 선택한 브랜치로 전환 |
| Local branches 목록에서 `n` | 새 브랜치 생성 |
| `?` | 현재 화면 단축키 도움말 |
| `Esc` | 팝업 닫기 / 이전 화면 |
| `q` | LazyGit 종료 후 Neovim으로 복귀 |

## 기본 작업 흐름

1. 코드를 수정한 뒤 `:w`로 저장합니다.
2. `]c`와 `Space hp`로 변경 내용을 확인합니다.
3. 이번 커밋에 넣을 부분에서 `Space hs`를 누릅니다. 일부 줄만 넣으시려면 `V`로 줄을 선택한 뒤 `Space hs`를 누릅니다.
4. `Space gg`로 LazyGit을 열고 Files 패널에서 stage된 내용을 확인합니다.
5. `c`로 메시지를 입력하고 `Enter`로 커밋합니다.
6. 원격 저장소에 올리시려면 `P`를 누릅니다.
7. `q`로 편집 화면에 돌아옵니다.

파일 전체를 커밋하실 때는 3번을 생략하고 LazyGit의 Files 패널에서 `Space`로 stage하셔도 됩니다.

## 공식 문서

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
- [LazyGit 기본 키 설정](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md)

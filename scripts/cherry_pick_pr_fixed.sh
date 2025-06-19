#!/bin/bash

 

# 사용법: ./cherry_pick_pr_fixed.sh <커밋해시1> [커밋해시2 ...]

# 대상 base 브랜치: main (고정)

# 리모트: origin (고정)

 

base_branch="main"

remote="origin"

first_commit=$1

 

if [ -z "$first_commit" ]; then

  echo "❌ 최소 한 개 이상의 커밋 해시를 입력하세요"

  exit 1

fi

 

branch_name="${base_branch}_cherry_pick_${first_commit:0:7}"

echo "📌 기준 브랜치: $base_branch"

echo "🌿 새로운 브랜치: $branch_name"

 

# 브랜치 생성

git checkout -b "$branch_name" "$base_branch" || exit 1

 

# 모든 인자를 cherry-pick

for commit in "$@"

do

  echo "🍒 cherry-pick 중: $commit"

  git cherry-pick "$commit" || {

    echo "❌ cherry-pick 실패: $commit"

    echo "➡ 수동으로 해결 후 'git cherry-pick --continue' 또는 '--abort'"

    exit 1

  }

done

 

# 푸시

git push "$remote" "$branch_name" || exit 1

 

# PR 링크 생성

repo_path=$(git config --get remote.$remote.url | sed -E 's#(git@|https://)github.com[:/](.*)\\.git#\\2#')

echo ""

echo "✅ 완료! GitHub PR 생성:"

echo "🔗 https://github.com/$repo_path/compare/$base_branch...$branch_name"

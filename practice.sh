#!/bin/sh

MODE="$1"

printf '受け取った引数: %s\n' "$MODE"

case "$MODE" in
    success)
        echo "正常終了します"
        exit 0
        ;;
    failure)
        echo "処理エラーとして終了します"
        exit 1
        ;;
    *)
        echo "引数不正として終了します"
        exit 9
        ;;
esac

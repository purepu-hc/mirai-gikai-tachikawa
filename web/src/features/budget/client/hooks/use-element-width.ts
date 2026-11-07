"use client";

import { type RefObject, useEffect, useState } from "react";

/**
 * 要素の横幅（px）を返す。サーバー描画時と計測前は fallback を返す。
 */
export function useElementWidth(
  ref: RefObject<HTMLElement | null>,
  fallback: number
): number {
  const [width, setWidth] = useState(fallback);
  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    const update = () => setWidth(el.clientWidth || fallback);
    update();
    const observer = new ResizeObserver(update);
    observer.observe(el);
    return () => observer.disconnect();
  }, [ref, fallback]);
  return width;
}

import { FileText, Landmark, type LucideIcon, Mail } from "lucide-react";
import type { Route } from "next";
import Link from "next/link";
import { routes } from "@/lib/routes";

interface ExploreNavProps {
  /** いまの定例会の slug（ある場合のみ「議案一覧」タイルを出す） */
  activeSessionSlug?: string | null;
}

interface ExploreNavItem {
  href: string;
  label: string;
  description: string;
  Icon: LucideIcon;
}

/**
 * トップページの「さがし方」タイル
 * 議案一覧・委員会・請願陳情への入口をまとめて並べる。
 */
export function ExploreNav({ activeSessionSlug }: ExploreNavProps) {
  const items: ExploreNavItem[] = [
    ...(activeSessionSlug
      ? [
          {
            href: routes.sessionBills(activeSessionSlug),
            label: "議案一覧",
            description: "いまの議会の議案をぜんぶ見る",
            Icon: FileText,
          },
        ]
      : []),
    {
      href: routes.committees(),
      label: "委員会からさがす",
      description: "テーマ別の委員会ごとに見る",
      Icon: Landmark,
    },
    {
      href: routes.petitions(),
      label: "請願・陳情",
      description: "市民からの要望と結果を見る",
      Icon: Mail,
    },
  ];

  return (
    <nav aria-label="議案のさがし方">
      <ul
        className={`grid grid-cols-1 gap-3 ${items.length === 3 ? "sm:grid-cols-3" : "sm:grid-cols-2"}`}
      >
        {items.map(({ href, label, description, Icon }) => (
          <li key={label}>
            <Link
              href={href as Route}
              className="flex h-full items-center gap-3 rounded-2xl border border-mirai-border bg-white px-4 py-3 hover:bg-muted/50 sm:flex-col sm:items-start sm:gap-2"
            >
              <Icon
                className="h-6 w-6 shrink-0 text-primary-accent"
                aria-hidden="true"
              />
              <span className="flex flex-col gap-0.5">
                <span className="text-sm font-bold">{label}</span>
                <span className="text-xs text-mirai-text-muted">
                  {description}
                </span>
              </span>
            </Link>
          </li>
        ))}
      </ul>
    </nav>
  );
}

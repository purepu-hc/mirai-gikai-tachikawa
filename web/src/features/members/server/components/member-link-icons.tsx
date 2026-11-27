import { House } from "lucide-react";
import Image from "next/image";
import type { Member } from "../../shared/types/member";
import { displayName } from "../../shared/utils/member-status";

/**
 * 本人のホームページとXへのアイコンリンク（一覧用）。
 * 見つからないものは出さない（推測で埋めない）。
 */
export function MemberLinkIcons({ member }: { member: Member }) {
  const name = displayName(member.name);
  if (!member.homepageUrl && !member.xUrl) {
    return (
      <span className="text-[11px] text-mirai-text-muted">公開情報なし</span>
    );
  }
  return (
    <span className="flex items-center gap-1">
      {member.homepageUrl && (
        <a
          href={member.homepageUrl}
          target="_blank"
          rel="noopener noreferrer"
          aria-label={`${name}のホームページ（新しいタブで開く）`}
          className="flex size-10 items-center justify-center rounded-full hover:bg-muted"
        >
          <House className="size-5 text-mirai-text-secondary" aria-hidden />
        </a>
      )}
      {member.xUrl && (
        <a
          href={member.xUrl}
          target="_blank"
          rel="noopener noreferrer"
          aria-label={`${name}のX（新しいタブで開く）`}
          className="flex size-10 items-center justify-center rounded-full hover:bg-muted"
        >
          <Image
            src="/icons/sns/icon_x.png"
            alt=""
            width={20}
            height={20}
            className="size-5"
          />
        </a>
      )}
    </span>
  );
}

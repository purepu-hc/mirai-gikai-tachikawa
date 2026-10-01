import { LinkButton } from "@/components/top/link-button";
import { siteConfig } from "@/config/site.config";

/**
 * デスクトップメニュー: アクションボタン（サイドバー内）
 *
 * - 「〇〇とは」は aboutNote が設定されている場合のみ表示（空リンクを出さない）
 * - 「寄附で応援する」はチームみらいへの寄附リンクのため、
 *   showTeamMiraiSection が有効な場合のみ表示（非公式版で党への寄附を案内しない）
 */
export function DesktopMenuActionButtons() {
  const aboutNote: string = siteConfig.externalLinks.aboutNote;
  const showDonation: boolean = siteConfig.features.showTeamMiraiSection;

  if (!aboutNote && !showDonation) {
    return null;
  }

  return (
    <div className="flex flex-col gap-3">
      {aboutNote && (
        <LinkButton
          href={aboutNote}
          icon={{
            src: "/icons/note-icon.png",
            alt: "note",
            width: 20,
            height: 20,
          }}
        >
          {siteConfig.siteName}とは
        </LinkButton>
      )}

      {showDonation && (
        <LinkButton
          href={siteConfig.externalLinks.donation}
          icon={{
            src: "/icons/heart-icon.svg",
            alt: "寄附",
            width: 20,
            height: 20,
          }}
        >
          寄附で応援する
        </LinkButton>
      )}
    </div>
  );
}

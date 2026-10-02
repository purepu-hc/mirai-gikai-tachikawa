import type { BillStatusEnum } from "../types";

export type BadgeVariant = "light" | "default" | "dark" | "muted";

/** 請願・陳情かどうか */
export function isPetition(billType: string | null | undefined): boolean {
  return billType === "petition";
}

/**
 * 議案カード・詳細のステータスバッジの表示ラベル。
 * 請願・陳情は「採択／不採択／審査中」の言葉で表示する。
 */
export function getStatusBadgeLabel(
  status: BillStatusEnum,
  billType?: string | null
): string {
  if (isPetition(billType)) {
    switch (status) {
      case "submitted":
        return "受理";
      case "in_committee":
      case "plenary_session":
        return "審査中";
      case "adopted":
      case "approved":
        return "採択";
      case "partially_adopted":
        return "一部採択";
      case "rejected":
        return "不採択";
      default:
        return "受理前";
    }
  }
  switch (status) {
    case "submitted":
      return "上程済み";
    case "in_committee":
      return "委員会審査中";
    case "plenary_session":
      return "本会議採決中";
    case "approved":
      return "可決";
    case "rejected":
      return "否決";
    case "adopted":
      return "採択";
    case "partially_adopted":
      return "一部採択";
    case "reported":
      return "専決処分報告";
    default:
      return "議案上程前";
  }
}

/** ステータスバッジの色の種類 */
export function getStatusBadgeVariant(status: BillStatusEnum): BadgeVariant {
  switch (status) {
    case "submitted":
    case "in_committee":
    case "plenary_session":
      return "light";
    case "approved":
    case "adopted":
    case "partially_adopted":
    case "reported":
      return "default";
    case "rejected":
      return "dark";
    default:
      return "muted";
  }
}

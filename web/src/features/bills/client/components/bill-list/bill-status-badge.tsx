import { Badge } from "@/components/ui/badge";
import type { BillStatusEnum } from "../../../shared/types";
import {
  getStatusBadgeLabel,
  getStatusBadgeVariant,
} from "../../../shared/utils/status-badge-label";

interface BillStatusBadgeProps {
  status: BillStatusEnum;
  /** 請願・陳情（petition）なら採択／不採択の言葉で表示する */
  billType?: string | null;
  className?: string;
}

export function BillStatusBadge({
  status,
  billType,
  className,
}: BillStatusBadgeProps) {
  return (
    <Badge variant={getStatusBadgeVariant(status)} className={className}>
      {getStatusBadgeLabel(status, billType)}
    </Badge>
  );
}

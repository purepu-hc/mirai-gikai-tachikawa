import { Search } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { routes } from "@/lib/routes";
import { MAX_KEYWORD_LENGTH } from "../../shared/utils/search-keyword";

interface BillSearchFormProps {
  defaultValue?: string;
  className?: string;
}

/**
 * 議案・請願・陳情の検索窓。JavaScript なしでも動く通常のフォーム（GET /search?q=...）
 */
export function BillSearchForm({
  defaultValue,
  className,
}: BillSearchFormProps) {
  return (
    <form
      action={routes.search()}
      method="get"
      role="search"
      className={`flex items-center gap-2 ${className ?? ""}`}
    >
      <label htmlFor="bill-search-q" className="sr-only">
        議案・請願・陳情を検索
      </label>
      <Input
        id="bill-search-q"
        type="search"
        name="q"
        defaultValue={defaultValue}
        maxLength={MAX_KEYWORD_LENGTH}
        placeholder="議案・請願・陳情をさがす（例：公園、子ども）"
        className="h-11 rounded-full bg-white px-4"
      />
      <Button type="submit" className="h-11 rounded-full px-5 shrink-0">
        <Search className="h-4 w-4" aria-hidden="true" />
        検索
      </Button>
    </form>
  );
}
